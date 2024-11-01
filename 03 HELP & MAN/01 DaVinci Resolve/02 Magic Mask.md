# [Render did not complete](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=149942)

<img src="https://github.com/orrstudio/Manuals/raw/main/03 HELP & MAN/01 DaVinci Resolve/Render did not complete.PNG" width="30px" height="30px" scale="50%" title="hover text" alt="accessibility text">

Я использовал "Magic Mask" в Fusion, и он выдавал мне предупреждение об ошибке:  
```
"Warning! Render did not complete!  
Last frame successfully completed: (none)  
(Desired range: 1.0 to 60)".  
```
Мои настройки в меню "Воспроизведение" были следующими:  
```
"Proxy Handling" - был в режиме «[Prefer Proxies]( "Предпочитать прокси")»  
"[Timeline Playback Resolution]( "Разрешении воспроизведения временной шкалы")" - было выставлено «[Quarter]( "для более плавного воспроизведения")».  
```
Решением проблемы стало:  
«отключить все прокси» и использовать разрешение воспроизведения временной шкалы «Full».  

