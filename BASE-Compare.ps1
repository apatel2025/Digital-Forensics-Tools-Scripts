#Powershell script compares output files we got from our baseline analysis.

echo "Hot-Fix Changes`r`n--------------------------------------------------------------------------------------------------------------------------------------"
$1=import-clixml .\hotfix1.xml
$2=import-clixml .\hotfix2.xml
Compare-Object $1 $2 -property Source,Description,HotFixID, InstalledBy,InstalledOn 

echo "Installed software changes`r`n---------------------------------------------------------------------------------------------------------------------------"
$3=import-clixml .\instSoft1.xml
$4=import-clixml .\instSoft2.xml
Compare-Object $3 $4 -property Vendor, Name, Version, InstallDate 

echo "TCP connection Changes`r`n-------------------------------------------------------------------------------------------------------------------------------"
$5=import-clixml .\netconn1.xml
$6=import-clixml .\netconn2.xml
Compare-Object $5 $6  -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, AppliedSetting 

echo "ProcessID changes`r`n------------------------------------------------------------------------------------------------------------------------------------"
$7=import-clixml .\runProc1.xml
$8=import-clixml .\runProc2.xml
Compare-Object $7 $8 -Property ProcessName, ID 

echo "Changes in Running Services`r`n--------------------------------------------------------------------------------------------------------------------------"
$9=import-clixml .\runServ1.xml
$a=import-clixml .\runServ2.xml
Compare-Object $9 $a -Property Status, Name, DisplayName
 
echo "UDPConnection changes`r`n--------------------------------------------------------------------------------------------------------------------------------"
$b=import-clixml .\udpconn1.xml
$c=import-clixml .\udpconn2.xml
Compare-Object $b $c -Property LocalAddress, LocalPort 





