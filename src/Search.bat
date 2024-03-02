chcp 65001
@echo off
set opwd=%cd% 
echo -----
for %%i in (C:\ D:\ E:\ F:\ G:\ H:\ I:\ J:\ K:\) do (
	if exist %%i (
        echo.
		echo Searching for %%i ...
        echo It takes time. Be patiently.
		cd /d %%i
        dir /S/b "settings.sol"
	)
)
cd /d %opwd%
echo Done.
pause