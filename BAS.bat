@echo off
title Building Minecraft Classic Forever
setlocal

echo Type your mod ver file name!
set /p FN=Type here (with .jar):

if not exist "build" mkdir build
if not exist "build\classes" mkdir build\classes

echo Copying resources...
xcopy /E /Y "src\main\resources\*" "build\classes\"

echo Compiling...
set CP="Files\lib\lwjgl.jar;Files\lib\lwjgl_util.jar;Files\lib\jinput.jar"
dir /s /b src\main\java\*.java > sources.txt
javac -cp %CP% -d build\classes @sources.txt

if errorlevel 1 (
    echo Compilation failed!
    pause
    exit /b
)

echo Creating JAR...
cd build\classes
jar cvfe ..\..\Files\%FN% com.mojang.minecraft.Minecraft *
cd ..\..

echo Done! JAR created: %FN%
echo.
rmdir /s /q build
del sources.txt
java -Djava.library.path=Files\natives -cp "Files\%FN%;Files\lib\*" org.oyasunadev.minecraft.Start