@echo off
echo.
echo KILL arma2oaserver1061.exe
set serverkill="D:\1061\"
cd /d %serverkill%
taskkill /im arma2oaserver1061.exe
echo.
echo Kill Bec.exe
set beckill="D:\1061\instance_11_Chernarus\BattlEye\Bec"
cd /d %beckill%
taskkill /im bec1061.exe

timeout 5

echo.
echo Rotate Logs
start "start" "D:\1061\instance_11_Chernarus\rotate_logs.bat" 

timeout 5


echo.
echo Starting Dayz Server
:: start the server..
set dayzpath="D:\1061\"
cd /d %dayzpath%
start "start" "Server_Start_New1061.bat"
echo.
echo Starting Bec
timeout 20
:: start bec
set becpath="D:\1061\instance_11_Chernarus\BattlEye\Bec"
cd /d %becpath%
start "start" "bec1061.exe" -f Config.cfg
echo.
echo Server Started 100%

cls
@exit