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

echo Flash Reable Entra - Delete All the Settings.sol. 
echo Author:RunLing
echo Github:https://github.com/RunlingDev/FlashReable

echo -----

color 4F
echo Disclaimer:
echo This script will search and delete ALL file named "settings.sol".
echo IT MIGHT CAUSE UNKONWN PROBLEM.
echo If so, the writer WON'T take responsibility
echo Continue?Exit by close this window.
echo.
echo 免责声明：

echo 这个脚本将全盘遍历并删除所有名为"Settings.sol"的文件

echo 这可能导致文件丢失等未知问题

echo 如果您选择继续，出现的问题作者概不负责

echo 是否继续？

pause
echo -----

color 27
set opwd=%cd% 
for %%i in (C:\ D:\ E:\ F:\ G:\ H:\ I:\ J:\ K:\) do (
	if exist %%i (
		echo Searching for %%i ...
        echo It takes time. Be patiently.
        echo 这可能需要一段时间。请耐心等待。

		cd /d %%i
        for /f "delims=" %%a in ('dir /S/b "settings.sol"') do (
            echo Find "settings.sol":%%a
            echo Overwriting...
        	echo 2>"%%a"
        	attrib "%%a" +r
            echo Done.
		)
        echo -----
	)
)
cd /d %opwd%
echo Done.The "settings.sol" is now overwritten.

echo -----
color 1F
echo Settings.sol Overwriting Succeed.Congratulations!
echo Thanks for your using.
echo Note:You'd better run again the common version.
echo https://github.com/RunlingDev/FlashReable/releases/download/v1.1/flashreable.bat
pause