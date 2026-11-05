# Voice Input (voxtype), TTS-читалка и перевод буфера — сводка 2026-11-05

Озвучивание текста из буфера (клавиша **Pause**), диктовка voxtype,
перевод буфера на английский (**Ctrl+Pause** / **Ctrl+Shift+Pause**).
Все решения приняты вместе с пользователем, миграция из `~/.opencode/memory.md`.

---

## 0. Voxtype — голосовой ввод (диктовка)

Сервис: `voxtype.service` (user, systemd, enabled). Система: Arch + GNOME
Wayland, GTX 1650 (Vulkan).

Конфиг `~/.config/voxtype/config.toml`:
- `model = "large-v3-turbo"` (~1.6 ГБ, `~/.local/share/voxtype/models/`),
  грузится на GPU через Vulkan, `flash_attention = true`
- `language = ["ru", "en", "az"]` — автоопределение из трёх. Турецкий (tr)
  пробовали и убрали: whisper путал az↔tr; азербайджанский у whisper слабый
- `max_duration_secs = 300` (было 60 — поднято 2026-11-05)
- `mode = "paste"` — ОБЯЗАТЕЛЬНО для GNOME (см. правило 3)
- hotkey: Scroll Lock, push-to-talk (зажал — говоришь, отпустил — текст)
- VAD включён (Silero): на речи результат идентичен, на тишине спасает от
  галлюцинаций whisper ("Thank you." без VAD / "No speech detected" с VAD)

Диктовка управляет: не устанавливать `initial_prompt` на азербайджанском —
при мультиязычном списке подсказка перетягивает автоопределение и портит
ru/en. Пользователь должен быть в группе `input` (для ydotool).

Диагностика:
- `voxtype status` (idle/recording/transcribing), `voxtype info accel` (GPU),
  `voxtype setup check` (цепочка вывода)
- `journalctl --user -u voxtype.service` (подробно: drop-in
  `~/.config/systemd/user/voxtype.service.d/verbose.conf`,
  `ExecStart=/usr/bin/voxtype -v daemon`)
- OSD-индикатор записи в GNOME НЕ работает (voxtype-osd требует Layer Shell,
  которого в Mutter нет) — ошибки в логе нормальны, не чинить; о результате
  сообщают уведомления

Отменённые идеи: вторая модель по Shift+Scroll Lock, глобальный
`translate = true` (убил бы русский ввод), toggle-режим, Kanata/жесты.

---

## 1. Итоговые горячие клавиши

| Клавиша | Действие |
|---|---|
| **Scroll Lock** (зажать) | voxtype: диктовка push-to-talk (ru/en/az, модель large-v3-turbo, GPU) |
| **Pause** | озвучить буфер обмена (читалка `say-clipboard`) |
| **Ctrl+Pause** | перевести буфер ru→en (trans/Google), результат заменяет буфер |
| **Ctrl+Shift+Pause** | перевести и сразу вставить в курсор |
| — | повторное **Pause** во время чтения = полный СТОП |

Привязки GNOME: custom7 (Pause, читалка), custom8 (Ctrl+Pause, только буфер),
custom9 (Ctrl+Shift+Pause, буфер+вставка).
Курсорная вставка: `ydotool key 29:1 47:1 47:0 29:0`
(wtype на GNOME-mutter не работает для вставки; ydotool — проверенный путь).

---

## 2. Финальная схема читалки `~/.local/bin/say-clipboard` (bash)

Маршрутизация по содержимому буфера:

| Текст в буфере | Голос |
|---|---|
| кириллица + цифры (латиницы нет) | **Silero, голос Бая**, темп ×1.3 |
| кириллица + латиница (смешанный) | **Ирина** (piper, скорость 0.7) — целиком |
| чисто латиница (английский) | **Amy** (piper en_US-amy-medium, 0.7) |
| только цифры/знаки | Бая |

- Триггер «латиница» = **любая** латинская буква (x, a, CI, main.c → Ирина).
  Скобки/кавычки/точки без латинских букв Ирину не включают.
- Piper — нативный (внутри onnxruntime, C++), старт мгновенный, RAM ~200 МБ.
- Silero — v4_ru через torch (venv), старт ~2.4 с, пик RAM ~700 МБ
  в момент чтения, между нажатиями висит ноль.
- Стоп-переключатель: pid-файл `/run/user/<uid>/say-clipboard.playpid`;
  второе нажатие убивает плеер+генераторы и выходит (раньше — перечитывал с
  начала — починено).
- Лимит текста 2000 символов (в скрипте).
- Каскад резервов: русский: Silero → piper Ирина → RHVoice (spd-say) → espeak;
  английский: piper Amy → spd-say → espeak-ng.
- piper не пишет из stdin у spd-say: текст передавать АРГУМЕНТОМ
  (`spd-say -l ru -- "текст"`).

### Переменные окружения (без правки скриптов)

| Переменная | Значение |
|---|---|
| `SAY_RU_ENGINE=piper` | вернуть Ирину основной для русского (вместо Бая) |
| `SILERO_VOICE=baya` | kseniya / xenia / aidar / eugene / random |
| `SILERO_TEMPO=1.3` | темп Баи (1.0 = естественный; 1.3 = темп Ирины 0.6) |
| `SAY_VOICE=ru_RU-irina-medium` | piper голос Ирина (denis — мужской) |
| `SAY_SPEED=0.7` | скорость Ирины (меньше = быстрее; 0.6 было по старому) |
| `SAY_VOICE_EN=en_US-amy-medium` | английский голос (ryan-high, lessac-high тоже скачаны) |
| `SAY_SPEED_EN=0.7` | скорость Amy (1.0 = естественная; выбрана после прослушки 0.7/1.0/1.2) |

---

## 3. Перевод буфера `~/.local/bin/translate-clipboard` (bash)

- движок: **trans** (translate-shell, Google Translate, онлайн). Argos отвергнут:
  AUR-пакеты сироты и отмечены устаревшими; CLI-Argos грузит модель с диска при
  каждом вызове (2–6 с); venv-питон пользователь не хотел.
- важный артефакт: `trans -b` вставляет ANSI-коды цвета даже при пайпе —
  ОБЯЗАТЕЛЬНО `-no-ansi`.
- направление по тексту: кириллица (`grep -P '\x{0400}-\x{04FF}'`) → en,
  иначе → ru. Повторное нажатие переводит обратно.
- лимит 4500 символов (Google ~5000 за запрос).
- ошибка сети/сервиса → notify-send «перевод не удался», буфер НЕ трогается.
- успех → `wl-copy` (буфер заменяется) + уведомление; `--paste` дополнительно
  вставляет Ctrl+V в курсор (ydotool, резерв wtype).

---

## 4. Файлы

| Путь | Что |
|---|---|
| `~/.local/bin/say-clipboard` | читалка буфера (текущая финальная схема) |
| `~/.local/bin/translate-clipboard` | перевод буфера (trans + wl-copy + notify) |
| `~/.local/bin/silero-generate` | генератор русского TTS Silero; одиночный + ПАКЕТНЫЙ режим (stdin куски через \x1e, `--out ШАБЛОН-с-##`, атомарная запись .part→rename, ffmpeg atempo во второй tmp-файл) |
| `~/.local/bin/text-split-runs` | сплиттер текста по смене алфавитов (сейчас say-clipboard не вызывает; оставлен про запас) |
| `~/.local/share/silero-venv/` | venv torch 2.15.0+cpu (удаление одной папкой) |
| `~/.local/share/piper/voices/` | irina, denis, amy-medium, ryan-high, lessac-high |
| `~/.local/share/voxtype/models/` | large-v3-turbo (1.6 ГБ) |
| `~/.opencode/memory.md` | рабочий журнал (свежее состояние всегда) |
| `~/.config/voxtype/config.toml` | max_duration_secs = 300 (было 60) |

---

## 5. Что НЕ сделано (осознанно), направления на потом

- **Google TTS через curl** (`translate_tts`, UA + Referer, mp3, куски ≤~200 симв.,
  латиницу в ру-запросе надо транслитерировать) — протестирован и ОТВЕРГНУТ по
  голосу (образцы g1/g2/gmix), но протокол рабочий и зафиксирован.
- **Silero ONNX-экспорт** (старт ~0.5–0.8 с, RAM ~300 МБ) — «кроличья нора»,
  отложено пользователем.
- Гибрид «проектор» (батч Silero + куски Piper Amy) — сделан, но ВЫКЛЮЧЕН
  (паузы при коротких кусках, Бая глотала латиницу по буквам).
- Amy / смешанный текст: piper одноязычен — «Amy читает русский» НЕВОЗМОЖНО.
- Kanata, жесты на Scroll Lock (тап/удержание) — не внедрены, отклонены.

---

## 6. Правила, ценные опытом (не терять)

1. `trans` всегда с `-b -no-ansi` при пайпе — иначе ANSI в буфере.
2. `spd-say` не читает stdin — текст аргументом.
3. `wtype` в GNOME не имитирует ввод текста и Ctrl+V (virtual-keyboard нет);
   ydotool (ydotoold) — рабочий путь вставки.
4. `torch.hub.load(..., trust_repo=True)` возвращает КОРТЕЖ из 2 значений —
   брать `res[0]` (старые примеры с 5 значениями нерабочие).
5. `soundfile.write(..., format="WAV")` для имён без стандартного расширения
   (`.part`); у ffmpeg для таких же имён тоже `-f wav`.
6. Piper = native+onnxruntime — «лёгкий плеер вместо полной студии PyTorch».
   Локального русского голоса уровня Amy без питон-студий на сегодня НЕТ.
7. `piper` в extra — конфигуратор игровых мышей, НЕ TTS (ловушка).
8. Голоса piper одноязычные; русская линейка piper — Ирина (жен)/Денис (муж).
9. Экспорт модели Silero в ONNX — не официальная процедура; готовы scripts,
   но это долгота.

---

## 7. Откат (если что-то пойдёт не так)

- Вернуть Ирину основной: `SAY_RU_ENGINE=piper say-clipboard` или убрать
  блок Silero из скрипта.
- Вернуть Ирину 0.6: `SAY_SPEED=0.6`.
- Выключить перевод: удалить custom8/custom9 из custom-keybindings GNOME.
- Полное удаление питона/venc: `rm -rf ~/.local/share/silero-venv`
  (обёртка тогда падает на резерв piper/RHVoice).
- Включить Silero BØРьбу заново если откативали: `SAY_RU_ENGINE=silero`.
