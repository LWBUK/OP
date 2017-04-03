timeout 5

::Start Dayz Server::

start "arma2" /high /affinity 1  "arma2oaserver1061.exe" -ip=78.31.67.100 -port=5300 -maxmem=2047 -noPause "-config=instance_11_Chernarus\config.cfg" "-cfg=instance_11_Chernarus\basic.cfg" "-profiles=instance_11_Chernarus" -name=instance_11_Chernarus "-mod=@DayzOverwatch;@DayZ_Epoch;@DayZ_Epoch_Server;"

cls

@exit