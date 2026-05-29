@echo off
:main
cls
dir /b Files\*.jar
set /p VER=Type version (with .jar):
java -Djava.library.path=Files\natives -cp "Files\%VER%;Files\lib\*" org.oyasunadev.minecraft.Start
pause
goto main