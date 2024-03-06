chcp 65001
@echo off
color 1F

rem GetUAC
echo Getting UAC...
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"
echo Get UAC Succeed.
cls

rem FlashReable
color 27
echo " _____ _     ____  ____  _       ____  _____ ____  ____  _     _____"
echo "/    // \   /  _ \/ ___\/ \ /|  /  __\/  __//  _ \/  __\/ \   /  __/"
echo "|  __\| |   | / \||    \| |_||  |  \/||  \  | / \|| | //| |   |  \  "
echo "| |   | |_/\| |-||\___ || | ||  |    /|  /_ | |-||| |_\\| |_/\|  /_ "
echo "\_/   \____/\_/ \|\____/\_/ \|  \_/\_\\____\\_/ \|\____/\____/\____\"
echo. & echo.

echo -----

echo Flash Reable - Auto Script to able Flash. 
echo Author:RunLing
echo Github:https://github.com/RunlingDev/FlashReable

echo -----

echo Deleting Settings.sol...
del /q /f "%userprofile%\AppData\Roaming\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\settings.sol"
echo Done.

echo New Empty Settings.sol...
set opwd=%cd%
cd /d "%userprofile%\AppData\Roaming\Macromedia\Flash Player\macromedia.com\support\flashplayer\sys\"
echo 2>settings.sol
attrib settings.sol +r
cd /d %opwd%
echo Done.

echo Editing hosts...
echo If the Manager reports error, please choose "allowed".

echo 如果杀毒软件报错，请选择允许。

cd /d "C:\Windows\System32\drivers\etc\"
attrib hosts -r
echo  127.0.0.1 flash.cn>>hosts
echo  127.0.0.1 geo2.adobe.com>>hosts
echo  127.0.0.1 macromedia.com>>hosts
echo  127.0.0.1 fpdownload.macromedia.com>>hosts
echo  127.0.0.1 fpdownload2.macromedia.com>>hosts
cd /d %opwd%
echo Done.

echo -----
color 1F
echo Flash Player Reable Succeed.Congratulations!
echo You can now use Adobe Flash Player without FlashHelper.
echo Thanks for your using.
echo Note:If it couldn't work, try to use the extra version of this script:
echo https://github.com/RunlingDev/FlashReable/releases/download/v1.1/extra_fra.bat
pause