@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Verificando permissões 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Pedindo privilegio para executar.
if '%errorlevel%' NEQ '0' (
    echo Requisitando privilegios de administrador...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

:start
cls
echo ###############################################################################################################
echo #                                                                                                             #
echo #  Lembre de atualizar o aplicativo "instalador de aplicativo" na Microsoft Store antes de executar o script, #
echo #  caso contrario nao funciona!                                                                               #
echo #  Este script foi desenvolvido Por Fal_Gamerr, RyanK_ e Samuca para Windows 10 e Windows 11                  #
echo #                                                                                                             #
echo ###############################################################################################################
pause
goto menu

:menu
cls
echo   ###############################################
echo   #                                             #
echo   #            SELECIONE UMA OPCAO :            #  
echo   #                                             #
echo   #     1 - Configuracao inicial completa       #
echo   #     2 - Limpar programas preinstalados      #
echo   #     3 - Instalar programas basicos          #
echo   #     4 - Instalar Offices                    #
echo   #     5 - Otimizar                            #
echo   #     0 - Sair                                #
echo   #                                             #
echo   ###############################################
set /p opcao=Opcao:
if "%opcao%"=="1" goto inicial
if "%opcao%"=="2" goto limpar
if "%opcao%"=="3" goto programas
if "%opcao%"=="4" goto office
if "%opcao%"=="5" goto otimizar
if "%opcao%"=="0" exit
goto menu

:inicial
cls
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
winget uninstall 9NBLGGH4QGHW --accept-source-agreements
winget uninstall 9WZDNCRDTBJJ
winget uninstall 9NBLGGH4R32N
winget uninstall 9WZDNCRD29V9
winget uninstall 9WZDNCRFJ1P3
winget uninstall 9WZDNCRFJBD8
winget uninstall 9WZDNCRFHVFW
winget uninstall 9NBLGGH42THS
winget uninstall 9NG1H8B3ZC7M
winget uninstall 9P1J8S7CCWWT
winget uninstall 9NCBCSZSJRSB
winget uninstall 9WZDNCRF0083
winget uninstall 9NH2GPH4JZS4
winget uninstall 9NKSQGP7F2NH
winget uninstall 9NWD3S85MTFB
winget uninstall 9NBLGGH5L9XT
winget uninstall Disney.37853FC22B2CE_6rarf9sa4v8jt
winget uninstall 22364Disney.ESPNBetaPWA_6rarf9sa4v8jt
winget uninstall AmazonVideo.PrimeVideo_pwbj9vvecjh7j
winget uninstall BytedancePte.Ltd.TikTok_6yccndn6064se
winget uninstall 5319275A.WhatsAppDesktop_cv1g1gvanyjgm
winget uninstall Facebook.InstagramBeta_8xx8rvfyw5nnt
winget uninstall FACEBOOK.317180B0BB486_8xx8rvfyw5nnt
winget uninstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0
winget uninstall Spotify.Spotify
winget uninstall Facebook.Messenger
winget uninstall WhatsApp.WhatsApp
winget uninstall Microsoft.OneDrive
winget uninstall Microsoft.Teams
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c
winget uninstall MicrosoftTeams_8wekyb3d8bbwe
winget uninstall Microsoft.Todos_8wekyb3d8bbwe
winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe
winget uninstall MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe
winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe
winget install RARLab.WinRAR
winget install Oracle.JavaRuntimeEnvironment
winget install Google.Chrome
winget install 9NZVDKPMR9RD --accept-package-agreements
winget install XPDP273C0XHQH2 --accept-package-agreements
winget install 9NCTDW2W1BH8 --accept-package-agreements
winget install 9MVZQVXJBQ9V --accept-package-agreements
winget install 9N95Q1ZZPMH4 --accept-package-agreements
winget install 9N4D0MSMP0PT
winget upgrade --all --include-unknown
pause
goto menu

:limpar
cls
winget uninstall 9NBLGGH4QGHW --accept-source-agreements
winget uninstall 9WZDNCRDTBJJ
winget uninstall 9NBLGGH4R32N
winget uninstall 9WZDNCRD29V9
winget uninstall 9WZDNCRFJ1P3
winget uninstall 9WZDNCRFJBD8
winget uninstall 9WZDNCRFHVFW
winget uninstall 9NBLGGH42THS
winget uninstall 9NG1H8B3ZC7M
winget uninstall 9P1J8S7CCWWT
winget uninstall 9NCBCSZSJRSB
winget uninstall 9WZDNCRF0083
winget uninstall 9NH2GPH4JZS4
winget uninstall 9NKSQGP7F2NH
winget uninstall 9NWD3S85MTFB
winget uninstall 9NBLGGH5L9XT
winget uninstall Disney.37853FC22B2CE_6rarf9sa4v8jt
winget uninstall 22364Disney.ESPNBetaPWA_6rarf9sa4v8jt
winget uninstall AmazonVideo.PrimeVideo_pwbj9vvecjh7j
winget uninstall BytedancePte.Ltd.TikTok_6yccndn6064se
winget uninstall 5319275A.WhatsAppDesktop_cv1g1gvanyjgm
winget uninstall Facebook.InstagramBeta_8xx8rvfyw5nnt
winget uninstall FACEBOOK.317180B0BB486_8xx8rvfyw5nnt
winget uninstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0
winget uninstall Spotify.Spotify
winget uninstall Facebook.Messenger
winget uninstall WhatsApp.WhatsApp
winget uninstall Microsoft.OneDrive
winget uninstall Microsoft.Teams
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c
winget uninstall MicrosoftTeams_8wekyb3d8bbwe
winget uninstall Microsoft.Todos_8wekyb3d8bbwe
winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe
winget uninstall MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe
winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe
pause
goto menu

:programas
cls
winget install RARLab.WinRAR
winget install Oracle.JavaRuntimeEnvironment
winget install Google.Chrome
winget install 9NZVDKPMR9RD --accept-package-agreements
winget install XPDP273C0XHQH2 --accept-package-agreements
winget install 9NCTDW2W1BH8 --accept-package-agreements
winget install 9MVZQVXJBQ9V --accept-package-agreements
winget install 9N95Q1ZZPMH4 --accept-package-agreements
winget install 9N4D0MSMP0PT
pause
goto menu

:office
cls
echo   ###############################################
echo   #                                             #
echo   #     SELECIONE O PACOTE OFFICE DESEJADO:     #
echo   #                                             #
echo   #            1 - Libre Office                 #
echo   #            2 - Only Office                  #
echo   #            3 - WPS Office                   #
echo   #            0 - Sair                         #
echo   #                                             #
echo   ###############################################
echo                                    por Fal e Ryan 
set /p opcao=Opcao:
if "%opcao%"=="1" goto libre
if "%opcao%"=="2" goto only
if "%opcao%"=="3" goto wps
if "%opcao%"=="0" goto menu
goto menu

:libre
cls
winget install TheDocumentFoundation.LibreOffice
pause
goto menu

:only
cls
winget install ONLYOFFICE.DesktopEditors
pause
goto menu

:wps
cls
winget install 9NSGM705MQWC
pause
goto menu

:otimizar
cls
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
winget upgrade --all --include-unknown
sfc /scannow
dism.exe /online /cleanup-image /scanhealth
dism.exe /online /cleanup-image /restorehealth
dism.exe /online /cleanup-image /startcomponentcleanup
for /f "skip=1" %%d in ('wmic logicaldisk get caption') do (
    defrag %%d /h /u /v
)
chkdsk /F /R
pause
goto menu