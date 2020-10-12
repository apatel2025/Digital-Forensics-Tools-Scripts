#Powershell script compares output files we got from our baseline analysis.

echo "Service creation Changes`r`n--------------------------------------------------------------------------------------------------------------------"
$1=import-clixml .\service1.xml
$2=import-clixml .\service2.xml
Compare-Object $1 $2 -property TimeCreated, ProviderName, Id, Message | sort -Unique

echo "User creation changes`r`n---------------------------------------------------------------------------------------------------------------------------"
$3=import-clixml .\user1.xml
$4=import-clixml .\user2.xml
Compare-Object $3 $4 -property TimeCreated, ProviderName, Id, Message 

echo "Adding users to privilege group`r`n-------------------------------------------------------------------------------------------------------------------------------"
$5=import-clixml .\addpriv1.xml
$6=import-clixml .\addpriv2.xml
Compare-Object $5 $6  -Property TimeCreated, ProviderName, Id, Message 

echo "Clearing security event logs`r`n------------------------------------------------------------------------------------------------------------------------------------"
$7=import-clixml .\clearevent1.xml
$8=import-clixml .\clearevent2.xml
Compare-Object $7 $8 -Property TimeCreated, ProviderName, Id, Message

echo "RDP terminal certificate creation`r`n--------------------------------------------------------------------------------------------------------------------------"
$9=import-clixml .\rdp1.xml
$a=import-clixml .\rdp2.xml
Compare-Object $9 $a -Property TimeCreated, ProviderName, Id, Message
 
echo "Firewall changes`r`n--------------------------------------------------------------------------------------------------------------------------------"
$b=import-clixml .\firewall1.xml
$c=import-clixml .\firewall2.xml
Compare-Object $b $c -Property TimeCreated, ProviderName, Id, Message 

echo "External media connected`r`n--------------------------------------------------------------------------------------------------------------------------------"
$b=import-clixml .\extmedia1.xml
$c=import-clixml .\extmedia2.xml
Compare-Object $b $c -Property TimeCreated, ProviderName, Id, Message 

echo "Lateral Movement changes`r`n--------------------------------------------------------------------------------------------------------------------------------"
$b=import-clixml .\lateralmov1.xml
$c=import-clixml .\lateralmov2.xml
Compare-Object $b $c -Property TimeCreated, ProviderName, Id, Message 

echo "Application Whitelisting `r`n--------------------------------------------------------------------------------------------------------------------------------"
$b=import-clixml .\applist1.xml
$c=import-clixml .\applist2.xml
Compare-Object $b $c -Property TimeCreated, ProviderName, Id, Message 
