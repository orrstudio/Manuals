# [Render did not complete](https://forum.blackmagicdesign.com/viewtopic.php?p=1093242#p1093242)

## Я использовал "Magic Mask" в Fusion, и он выдавал мне следующее предупреждение об ошибке:  

<img src="https://github.com/orrstudio/Manuals/raw/main/03 HELP & MAN/01 DaVinci Resolve/Render did not complete.PNG" width="500px" title="Warning! Render did not complete!">

>  
> "Warning! Render did not complete!  
> Last frame successfully completed: (none)  
> (Desired range: 1.0 to 60)".  
>  

## Мои настройки в меню "Воспроизведение" были следующими:  

>  
> "Proxy Handling" - был в режиме [Prefer Proxies](http:// "Предпочитать прокси")  
> [Timeline Playback Resolution](http:// "Разрешении воспроизведения временной шкалы") - было выставлено «[Quarter](http:// "для более плавного воспроизведения")».  
>  

## Решением проблемы стало:  
[Disable All Proxies](http:// "отключить все прокси") и использовать “Full” [Timeline Playback Resolution](http:// "разрешение воспроизведения временной шкалы").  

