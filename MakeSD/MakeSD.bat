@echo off
Title Quick 2GB SD

echo  Creating a 2GB SD card. . .
"%~dp0mksdcard.exe" 2048M "sd.raw"
move "sd.raw" "..\Dolphin\User\Wii\"
echo.
echo  Created.
