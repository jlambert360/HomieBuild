del .\Build\Project+\NETPLAY.txt /Q
del .\Build\Project+\NETBOOST.txt /Q
del .\Build\Project+\pf\menu3\dnet.cmnu /Q
rmdir .\Build\Project+\pf\movie /s /q
rmdir .\Build\Project+\pf\sound\netplaylist /s /q
rmdir .\Build\Project+\Source\Netplay /s /q
powershell.exe .\RenameFilesForWiiBuild.ps1
call "MakeSD\nonsecureSendKeys.bat" "progfortr" "{Enter}"
".\Build\Project+\GCTRealMate.exe" ".\Build\Project+\RSBE01.txt"
call "MakeSD\nonsecureSendKeys.bat" "progfortr" "{Enter}"
".\Build\Project+\GCTRealMate.exe" ".\Build\Project+\BOOST.txt"
call "MakeSD\nonsecureSendKeys.bat" "progfortr" "{Enter}"
powershell.exe .\ZipWiiFiles.ps1
del .\Build\Project+\RSBE01.GCT /Q
del .\Build\Project+\BOOST.GCT /Q