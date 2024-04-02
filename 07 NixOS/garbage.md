Чтобы удалить старые загрузки Grub в NixOS, вы можете выполнить следующие шаги:


Сначала выполните сбор мусора в вашей системе, затем пересоберите. Первая команда в примере ниже удаляет все, что старше 1-го дня:

```bash
sudo nix-collect-garbage --delete-older-than 1d
sudo nixos-rebuild boot
```

Если у вас нет файла configuration.nix на вашем сервере NixOS, вы можете выполнить следующие команды:
```bash
nix-env --delete-generations old --profile /nix/var/nix/profiles/system
/nix/var/nix/profiles/system/bin/switch-to-configuration switch
```
Это удалит все, кроме самых новых корней сборки мусора системы, и обновит grub.cfg только с профилями живой системы2.


Пожалуйста, учтите, что nix-collect-garbage -d не очищает записи загрузки grub2.
