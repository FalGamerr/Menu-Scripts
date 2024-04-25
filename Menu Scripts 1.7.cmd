@echo off
title Menu Scripts
chcp 65001
cls

:: BatchGotAdmin
REM verifica o status de execução do script como administrador, solicita a permissão e inicia o script novamente
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
	echo Requisitando privilégios de administrador...
	goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	copy %0 "%temp%\fgms.cmd" /y
	echo UAC.ShellExecute "cmd.exe", "/K %temp%\fgms.cmd", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs"
	del "%temp%\getadmin.vbs"
	exit /B
:gotAdmin
	pushd "%CD%"
	CD /D "%~dp0"

:inicio
REM Menságem de aviso.
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #  Lembre de atualizar o aplicativo "instalador de aplicativo" na Microsoft Store antes de executar o script, #
echo #  caso contrário não funcionará                                                                              #
echo #                                                                                                             #
echo ===============================================================================================================
pause
goto menu

:menu
REM Menu principal do script com seleção de opção por número.
cls
echo ===============================================================================================================
echo #                                              Menu Scripts 1.7                                               #
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                            Selecione uma opção:                                             #
echo #                                                                                                             #
echo #                                         1 - Configuração inicial completa                                   #
echo #                                         2 - Limpar programas pré-instalados                                 #
echo #                                         3 - Instalar programas básicos                                      #
echo #                                         4 - Instalar Offices                                                #
echo #                                         5 - Otimizar                                                        #
echo #                                         6 - Aplicativos                                                     #
echo #                                         7 - Resolução de Problemas                                          #
echo #                                         8 - Drivers                                                         #
echo #                                         9 - Sobre                                                           #
echo #                                         0 - Sair                                                            #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opção:
if "%opcao%"=="1" goto inicial
if "%opcao%"=="2" goto limpar
if "%opcao%"=="3" goto programas
if "%opcao%"=="4" goto office
if "%opcao%"=="5" goto otimizar
if "%opcao%"=="6" goto apps
if "%opcao%"=="7" goto problemas
if "%opcao%"=="8" goto drivers
if "%opcao%"=="9" goto sobre
if "%opcao%"=="0" exit
goto menu

:inicial
REM Essa opção serve para pcs recém formatados, configura energia em alto desempenho, roda um trecho para desinstalar bloatwares e outro para instalar programas básicos e verifica a update dos aplicativos instalados.
cls
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
call :desinstalar X
call :instalar Y
winget upgrade --all --include-unknown
pause
goto menu

:limpar
cls
:desinstalar
REM Esse próximo código desinstala apenas bloatwares embarcados no Windows 11 23H2 todas as versões
winget uninstall Clipchamp.Clipchamp_yxz26nhyzhsrt Microsoft.BingNews_8wekyb3d8bbwe Microsoft.GamingApp_8wekyb3d8bbwe Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe Microsoft.Todos_8wekyb3d8bbwe Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe Microsoft.OneDrive 9WZDNCRDTBJJ --accept-source-agreements
REM Esse próximo código desinstala apenas bloatwares embarcados no Windows 10 22H2 todas as versões
winget uninstall 9NBLGGH4QGHW 9WZDNCRDTBJJ 9NBLGGH4R32N 9WZDNCRD29V9 9NBLGGH42THS 9NG1H8B3ZC7M Microsoft.SkypeApp_kzf8qxf38zg5c Microsoft.Office.OneNote_8wekyb3d8bbwe Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe Microsoft.XboxApp_8wekyb3d8bbwe --accept-source-agreements
REM Os trechos seguintes desinstalam bloatwares individualmente desde a versão 1903 do Windows 10 até as mais recentes, para que não hajam interrupções por erro no winget.
winget uninstall 9NBLGGH4QGHW --accept-source-agreements
winget uninstall 9WZDNCRDTBJJ
winget uninstall 9NBLGGH4R32N
winget uninstall 9WZDNCRD29V9
winget uninstall 9WZDNCRFJ1P3
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
winget uninstall Clipchamp.Clipchamp_yxz26nhyzhsrt
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
winget uninstall Microsoft.BingNews_8wekyb3d8bbwe
winget uninstall Microsoft.OneDrive
winget uninstall Microsoft.Teams
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c
winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe
winget uninstall MicrosoftTeams_8wekyb3d8bbwe
winget uninstall Microsoft.Todos_8wekyb3d8bbwe
winget uninstall Microsoft.OutlookForWindows_8wekyb3d8bbwe
winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe
winget uninstall MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe
winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe
winget uninstall Microsoft.OutlookForWindows_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe
if "%1"=="X" exit /B
pause
goto menu

:programas
cls
REM Próximo trecho instala o winrar, o java, chrome, firefox, acrobat reader e plugins de execução de vídeo e imagem
:instalar
winget install RARLab.WinRAR Oracle.JavaRuntimeEnvironment Google.Chrome 9NZVDKPMR9RD XPDP273C0XHQH2 9NCTDW2W1BH8 9MVZQVXJBQ9V 9N95Q1ZZPMH4 9N4D0MSMP0PT 9N4D0MSMP0PT --accept-package-agreements
if "%1"=="Y" exit /B
pause
goto menu

:office
REM essa seção dá opções de aplicativos para escritório gratuitos ou por assinatura, ao selecionar ele faz download e instala os respectivos aplicativos.
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                          Selecione o App desejado:                                          #
echo #                                                                                                             #
echo #                                          1 - Microsoft Office                                               #
echo #                                          2 - Libre Office                                                   #
echo #                                          3 - Only Office                                                    #
echo #                                          4 - WPS Office                                                     #
echo #                                          0 - Voltar                                                         #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto microsoft
if "%opcao%"=="2" goto libre
if "%opcao%"=="3" goto only
if "%opcao%"=="4" goto wps
if "%opcao%"=="0" goto menu
goto menu

:microsoft
cls
winget install 9WZDNCRD29V9
pause
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
REM Essa opção seleciona o modo de energia alto desempenho, verifica a atualização de aplicativos compatíveis com winget, executa todas as instancias do dism, executa a verificação de arquivos do sistema, desfragmenta e invoca o checkdisk
cls
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
winget upgrade --all --include-unknown
dism.exe /online /cleanup-image /restorehealth
dism.exe /online /cleanup-image /startcomponentcleanup
sfc /scannow
chcp 1252 > nul
for /f "skip=1" %%d in ('wmic logicaldisk get caption') do (
    defrag %%d /h /u /v
)
chcp 65001 > nul
chkdsk /F /R
pause
goto menu

:apps
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                          Selecione a opção desejada:                                        #
echo #                                                                                                             #
echo #                                          1 - Pesquisar Apps                                                 #
echo #                                          2 - Atualizar Apps instalados                                      #
echo #                                          0 - Voltar                                                         #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto pesquisar
if "%opcao%"=="2" goto atualizar
if "%opcao%"=="0" goto menu
goto menu

:pesquisar
REM Dá uma interface para pesquisa e instalação de aplicativos através do winget
cls
set /p app=Digite o nome do aplicativo:
winget search "%app%"

echo O que deseja fazer?:
echo 1 - Instalar
echo 2 - Continuar pesquisando
echo 0 - Voltar
set /p opcao="Opcao:"
if "%opcao%"=="1" goto instalarapp
if "%opcao%"=="2" goto pesquisar
if "%opcao%"=="0" goto menu

:instalarapp
set /p app="Digite o ID do aplicativo:"
winget install "%app%"
pause
goto menu

:atualizar
REM Atualiza os aplicativos do pc compatíveis com winget.
cls
winget upgrade --all --include-unknown
pause
goto menu

:problemas
REM Essa seção dá opções de solução para problemas comuns e conhecidos do windows.
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                                   Selecione:                                                #
echo #                                                                                                             #
echo #                                               1 - Limpar temps e prefetch (Reiniciar)                       #
echo #                                               2 - Resetar Defender                                          #
echo #                                               3 - Resetar IP                                                #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto temp
if "%opcao%"=="2" goto defender
if "%opcao%"=="3" goto resetip
if "%opcao%"=="0" goto menu
pause
goto menu

:temp
cls
echo Ao finalizar o procedimento, digite exit e reinicie o pc.
pause
rmdir /q /s "%systemroot%\Prefetch\"
rmdir /q /s "%systemroot%\temp\"
rmdir /q /s "%temp%\"
pause
goto problemas

:defender
cls
start "ps" /wait powershell.exe -Command "Get-AppxPackage Microsoft.SecHealthUI -AllUsers | Reset-AppxPackage"
pause
goto problemas

:resetip
cls
ipconfig /release
ipconfig /renew
ipconfig /flushdns
pause
goto problemas

:drivers
REM Essa seção dá opções de drivers para serem baixados e instalados no seu pc, alguns são automatizados, outros somente execução manual.
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                              Selecione a marca do dispositivo:                              #
echo #                                                                                                             #
echo #                                               1 - Lenovo                                                    #
echo #                                               2 - Dell                                                      #
echo #                                               3 - Acer (Beta)                                               #
echo #                                               4 - HP                                                        #
echo #                                               5 - Asus                                                      #
echo #                                               6 - Asrock                                                    #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto lenovo
if "%opcao%"=="2" goto dell
if "%opcao%"=="3" goto acer
if "%opcao%"=="4" goto hp
if "%opcao%"=="5" goto asus
if "%opcao%"=="6" goto asrock
if "%opcao%"=="0" goto menu
goto menu

:lenovo
cls
winget install Lenovo.SystemUpdate
echo Execute o aplicativo "System Update" e avance para a instalação de drivers do seu lenovo.
pause
goto menu

:dell
cls
start "web" "https://dl.dell.com/serviceability/eSupport/SupportAssistLauncher.exe"
echo Execute o aplicativo "SupportAssistLauncher.exe" que foi baixado na pasta downloads, ao finalizar a instalação 
echo clique na seta inferior na janela aberta e utilize a seção drivers para buscar e instalar os mesmos.
pause
goto menu

:acer
cls
Winget install ULICTekInc.AcerSense5.0_nt9dgb7efx6bt
echo Execute o aplicativo "AcerSense", siga as instruções, ao chegar na pagina principal utilize a seção drivers
echo para buscar e instalar os mesmos.
pause
goto menu

:hp
cls
start "web" "https://support.hp.com/br-pt/drivers"
echo Siga as instruções do site para selecionar seu dispositivo, selecione "Deixe a HP detectar seu produto" e 
echo inicie o download, execute o app, instale, vá em meu dispositivo e na aba downloads utilize a seção drivers
echo para buscar e instalar os mesmos.
pause
goto menu

:asus
cls
start "web" "https://www.asus.com/br/support/download-center/"
echo Siga as instruções do site para localizar o modelo, selecione suporte, drivers e firmware, selecione a versão
echo do sistema operacional, baixe os drivers desejados e execute manualmente um por um usando "Setup" dentro das
echo pastas baixadas no site.
pause
goto menu

:asrock
cls
start "web" "https://www.asrock.com/support/index.br.asp"
echo Siga as instruções do site para localizar o modelo, selecione suporte, drivers e firmware, selecione a versão
echo do sistema operacional, baixe os drivers desejados e execute manualmente um por um usando "Setup" dentro das
echo pastas baixadas no site.
pause
goto menu

:sobre
REM Essa seção serve apenas para créditos, texto explicativo e direcionamento para sites oficiais.
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #                                                   Selecione:                                                #
echo #                                                                                                             #
echo #                                               1 - Manual                                                    #
echo #                                               2 - Créditos e suporte                                        #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" goto manual
if "%opcao%"=="2" goto creditos
if "%opcao%"=="0" goto menu
goto menu

:manual
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #    Este Script é utilizado para automatizar e facilitar a configuração, manutenção do Windows, instalação   #
echo # de aplicativos utilizando o gerenciador de pacotes winget e mais outros comandos CMD (prompt de comandos).  #
echo # Você pode utilizar ele usando os números do teclado e a tecla enter para navegar entre as opções e utilizá- #
echo # las, e Ctrl + C para interromper os comandos em execução.                                                   #
echo #                                                                                                             #
echo #   Opção 1 configuração inicial completa: Configura o Windows desinstalando aplicativos pré-instalados       #
echo # do sistema (bloatwares) instalando aplicativos básicos (Winrar, Java, Chrome, Firefox, Acrobat Reader,      #
echo # codecs de vídeo e coloca no modo alto desempenho.                                                           #
echo #   Opção 2 Limpar programas pré-instalados: Faz a mesma limpeza de bloatwares da Opção 1.                    #
echo #   Opção 3 Instalar programas básicos: Instala os mesmos apps da Opção 1.                                    #
echo #   Opção 4 Instalar Offices: Mostra opções de aplicativos para escritório para instalação.                   #
echo #   Opção 5 Otimizar: Coloca no alto desempenho, atualiza todos os apps compatíveis com winget, executa       #
echo # sfc /scannow, dism, desfragmenta todos os discos conectados e executa o chkdsk (Opcional).                  #
echo #   Opção 6 Aplicativos: Dá opções para pesquisar apps compatíveis com winget ou atualizar eles.              #
echo #   Opção 7 Resolução de problemas: Dá opções que podem solucionar problemas do windows.                      #
echo #   Opção 8 Drivers: Dá opções de fabricantes para buscar drivers de dispositivos.                            #
echo #                                                                                                             #
echo ===============================================================================================================
pause
goto sobre

:creditos
cls
echo ===============================================================================================================
echo #                                                                                                             #
echo #    Este script foi desenvolvido Por Fal_Gamerr, obrigado a RyanK_, Samuca, Ofernandofilo e Maugusto por     #
echo # auxiliar na criação do script.                                                                              #
echo #    Compatível com Windows 10 e 11 com a última versão do instalador de aplicativos da Microsoft Store.      #
echo #    Caso queira contribuir com o projeto com uma doação, doe para a chave pix: falgamerr@gmail.com           #
echo #                                                                                                             #
echo #                                               1 - Site oficial                                              #
echo #                                               2 - Checar atualizações                                       #
echo #                                               3 - Canal no Youtube                                          #
echo #                                               4 - Instagram                                                 #
echo #                                               0 - Voltar                                                    #
echo #                                                                                                             #
echo ===============================================================================================================
set /p opcao=Opcao:
if "%opcao%"=="1" start "web" "https://github.com/FalGamerr/Menu-Scripts"
if "%opcao%"=="2" start "web" "https://github.com/FalGamerr/Menu-Scripts/releases/"
if "%opcao%"=="3" start "web" "https://youtube.com/user/FalGamerr"
if "%opcao%"=="4" start "web" "https://instagram.com/fabricio.yan.mm/"
if "%opcao%"=="0" goto sobre
goto sobre
