@echo off
setlocal

:: 设置 Windows Terminal 安装路径。（默认安装和 Scoop 安装）
set "wtDefaultPath=%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe"
set "wtScoopPath=%USERPROFILE%\scoop\apps\windows-terminal\current\wt.exe"
set "logFile=%~dp0Logs\Win11Debloat-Run.log"

:: 确保 Logs 文件夹存在
if not exist "%~dp0Logs" mkdir "%~dp0Logs"

:: 确定哪个终端存在
if exist "%wtDefaultPath%" (
    set "wtPath=%wtDefaultPath%"
) else if exist "%wtScoopPath%" (
    set "wtPath=%wtScoopPath%"
) else (
    set "wtPath="
)

:: 以下内容会被插入到下方的 PS 单引号字符串中；
:: 撇号通过 %:'=''% 转义，-File 参数使用 [char]34 以避免引号配对错误。
set "SCRIPT_PATH=%~dp0Win11Debloat.ps1"

if defined wtPath (
    call :Log 正在使用 Windows Terminal 启动 Win11Debloat.ps1...
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "$p='%SCRIPT_PATH:'=''%'; $w='%wtPath:'=''%'; $q=[char]34; Start-Process -FilePath $w -ArgumentList ('PowerShell -NoProfile -ExecutionPolicy Bypass -File ' + $q + $p + $q) -Verb RunAs" >> "%logFile%" || call :Error "PowerShell 命令失败"
) else (
    echo 未找到 Windows Terminal，使用默认 PowerShell...
    call :Log 未找到 Windows Terminal。使用默认 PowerShell 启动 Win11Debloat.ps1...
    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "$p='%SCRIPT_PATH:'=''%'; $q=[char]34; Start-Process PowerShell -ArgumentList ('-NoProfile -ExecutionPolicy Bypass -File ' + $q + $p + $q) -Verb RunAs" >> "%logFile%" || call :Error "PowerShell 命令失败"
)

echo.
echo 如果您需要进一步的帮助，请在以下地址提交问题：
echo https://github.com/Raphire/Win11Debloat/issues
goto :EOF

:: 日志记录函数
:Log
echo(%* >> "%logFile%"
goto :EOF

:: 错误处理程序
:Error
echo(错误: %*
call :Log 错误: %*
echo 已记录到 %logFile%
pause
goto :EOF