@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Verificando permissoes 
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

:inicio
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #  Lembre de atualizar o aplicativo "instalador de aplicativo" na Microsoft Store antes de executar o script, #
echo #  caso contrario nao funciona!                                                                               #
echo #                                                                                                             #
echo ===============================================================================================================
pause
goto menu

:menu
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                            SELECIONE UMA OPCAO :                                            #
echo #                                                                                                             #
echo #                                         1 - Configuracao inicial completa                                   #
echo #                                         2 - Limpar programas preinstalados                                  #
echo #                                         3 - Instalar programas basicos                                      #
echo #                                         4 - Instalar Offices                                                #
echo #                                         5 - Otimizar                                                        #
echo #                                         6 - Pesquisar App                                                   #
echo #                                         7 - Sobre                                                           #
echo #                                         0 - Sair                                                            #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto inicial
if "%opcao%"=="2" goto limpar
if "%opcao%"=="3" goto programas
if "%opcao%"=="4" goto office
if "%opcao%"=="5" goto otimizar
if "%opcao%"=="6" goto pesquisar
if "%opcao%"=="7" goto sobre
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
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                          Selecione o App desejado:                                          #
echo #                                                                                                             #
echo #                                          1 - Libre Office                                                   #
echo #                                          2 - Only Office                                                    #
echo #                                          3 - WPS Office                                                     #
echo #                                          0 - Voltar                                                         #
echo #                                                                                                             #
echo ===============================================================================================================
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

:pesquisar
cls
set /p app=Digite o nome do aplicativo:
winget search %app%

echo O que deseja fazer?:
echo 1 - Instalar
echo 2 - Continuar pesquisando
echo 0 - Voltar
set /p opcao=Opcao:
if "%opcao%"=="1" goto winget
if "%opcao%"=="2" goto pesquisar
if "%opcao%"=="0" goto menu

:winget
set /p app=Digite o ID do aplicativo:
winget install %app%
pause
goto menu

:sobre
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                                   Selecione:                                                #
echo #                                                                                                             #
echo #                                               1 - Manual                                                    #
echo #                                               2 - Creditos e suporte                                        #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto manual
if "%opcao%"=="2" goto creditos
if "%opcao%"=="0" goto menu
pause
goto menu

:manual
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #    Este app e utilizado para automatizar e facilitar a configuracao e manutencao do windows, instalacao de  #
echo # aplicativos utilizando o gerenciador de pacotes winget e mais outros comandos CMD (prompt de comandos) voce #
echo # pode utilizar ele usando os numeros do teclado e a tecla enter para navegar entre as opcoes e utiliza-las e #
echo # Control + C para interromper os comandos em execucao.                                                       #
echo #                                                                                                             #
echo #   Opcao 1 configuracao inicial completa: Configura o windows desinstalando aplicativos preinstalados        #
echo # do sistema (bloatwares) instalando aplicativos basicos (Winrar, Java, Chrome, Firefox, Acrobat Reader,      #
echo # codecs de video e coloca no modo alto desempenho.                                                           #
echo #   Opcao 2 Limpar programas preinstalados: Faz a mesma limpeza de bloatwares da Opcao 1.                     #
echo #   Opcao 3 Instalar programas basicos: Instala os mesmos apps da Opcao 1                                     #
echo #   Opcao 4 Instalar Offices: Mostra opcoes de aplicativos para escritorio gratuitos para instalacao.         #
echo #   Opcao 5 Otimizar: Coloca no alto desempenho, atualiza todos os apps compativeis com winget, executa       #
echo # sfc /scannow, dism, desfragmenta todos os discos conectados e executa o chkdsk (Opcional).                  #
echo #   Opcao 6 Pesquisar App: Faz uma pesquisa com o termo digitado nos repositorios winget e pergunta qual      #
echo # gostaria de instalar, copie a id do app selecionando com o mouse e apertando enter pra copiar e cole a id   #
echo # com Control + V para instalar o app desejado                                                                #
echo #                                                                                                             #
echo ===============================================================================================================
pause
goto menu

:Creditos
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo # Este script foi desenvolvido Por Fal_Gamerr, obrigado a RyanK_ e Samuca para auxiliar na criacao do script. #
echo # Compativel com Windows 10 e 11 com a ultima atualizacao do instalador de aplicativos da microsoft store.    #
echo #                                                                                                             #
echo #                                               1 - Site oficial                                              #
echo #                                               2 - Checar atualizacoes                                       #
echo #                                               3 - Canal no Youtube                                          #
echo #                                               4 - Instagram                                                 #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" start https://github.com/FalGamerr/Menu-Scripts
if "%opcao%"=="2" start https://github.com/FalGamerr/Menu-Scripts/releases/
if "%opcao%"=="3" start https://youtube.com/user/FalGamerr
if "%opcao%"=="4" start https://instagram.com/fabricio.yan.mm/
if "%opcao%"=="0" goto menu
pause
goto menu
