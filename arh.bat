rem архивация
rem a - Add
rem -mx=3 - степень сжатия быстрый
rem -tzip - формат файла архива zip
rem -bsp0 - индикатор прогресса не выводить
rem -sdel - удалить после удачной архивации -- не используется

7za.exe a -r0 -mx=3 -tzip  zip\UserInfo-004 -x!*.zip -x!*.exe -x!*.7z -x!debug -x!__history -x!RS
