@echo off 

taskkill /im arma3server.exe

xcopy /y "C:\Users\Simply\Documents\Arma 3\missions\supremacy.altis\mission.sqm" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy.altis\mission.sqm"
xcopy /y "C:\Users\Simply\Documents\Arma 3\missions\supremacy.altis\mission.sqm" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_client\mission.sqm"
xcopy /y "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server\compile\core\config (altis).sqf" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server\compile\core\config.sqf"

ping 127.0.0.1 -n 2 > nul
ping 127.0.0.1 -n 2 > nul
ping 127.0.0.1 -n 2 > nul

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_client" "C:\Arma_3_Server\mpmissions\supremacy.altis.pbo"

ping 127.0.0.1 -n 2 > nul

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server" "C:\Arma_3_Server\@supremacy_server\addons\supremacy_server.pbo"

ping 127.0.0.1 -n 2 > nul

del "C:\Arma_3_Server\mpmissions\supremacy.altis.pbo.bak"
del "C:\Arma_3_Server\@supremacy_server\addons\supremacy_server.pbo.bak"

start C:\Arma_3_Server\arma3server -port=2302 "-config=C:\Arma_3_Server\TADST\supremacy\TADST_config.cfg" "-cfg=C:\Arma_3_Server\TADST\supremacy\TADST_basic.cfg" "-profiles=C:\Arma_3_Server\TADST\supremacy" -name=supremacy "-mod=heli;mark;@extDB2;@supremacy_server" -enableHT
@exit