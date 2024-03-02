chcp 65001
@echo off
set opwd=%cd% 
color 4F
echo -----
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
color 17
echo -----
for %%i in (C:\ D:\ E:\ F:\ G:\ H:\ I:\ J:\ K:\) do (
	if exist %%i (
		echo Searching for %%i ...
        echo It takes time. Be patiently.
        echo 这可能需要一段时间。请耐心等待。

		cd /d %%i
        for /f "delims=" %%a in ('dir /S/b "settings.sol"') do (
        	echo 2>"%%a"
        	attrib "%%a" +r
		)
        echo -----
	)
)
cd /d %opwd%
echo Done.The "settings.sol" is now deleted.
echo -----
pause