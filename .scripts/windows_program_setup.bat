
@echo off

call:check_permissions
call:check_choco
call:install

:check_permissions
    :: http://stackoverflow.com/a/11995662
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
        exit 1
    )
goto:eof

:: Checking to see if chocolatey is installed
:check_choco
    where choco >nul 2>&1
    if %errorlevel%==1 (
        echo choco is not installed. Installing choco
        call:install_choco
    )
)
goto:eof

:install_choco
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
    where choco >null 2>null
    if %errorlevel%==1 (
        echo choco is not installed. Installing choco
        goto:failed
    )
goto:eof

:failed
    echo Error Could not install chocolatey!
    exit 1
goto:eof

:install
    :: Core programs
    choco install 7zip.install -y
    :: choco install atom -y
    choco install discord -y
    choco install everything  -y
    choco install f.lux -y
    :: choco install neovim -y
    choco install revo.uninstaller -y
    choco install spotify -y
    choco install teracopy -y
    :: choco install vim -y
    choco install vivalid -y
    choco install vlc -y
    choco install windirstat -y

    :: Programming
    :: choco install docker -y
    :: choco install pandoc -y
    choco install cmake -y
    choco install editorconfig.core -y
    choco install git -y
    :: choco install ninja -y
    choco install nodejs -y
    choco install pip -y
    choco install python -y
    choco install python2 -y
    :: choco install vagrant -y
    choco install vcredist2017 -y
    choco install visualstudio2017community -y
    choco install visualstudiocode -y

    :: Network and exparemental programs
    :: choco install wireshark -y
goto:eof

:end