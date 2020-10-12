#1. Service Creation
Get-WinEvent -FilterHashTable @{LogName="System";id=7030,7045} | Export-Clixml -path D:\baselog\service2.xml

#2.User Creation
Get-WinEvent -FilterHashTable @{LogName="SECURITY";id=4720,4722,4724,4738} | Export-Clixml -path D:\baselog\user2.xml

#3. Add user to privilege group
Get-WinEvent -FilterHashTable @{LogName="SECURITY";id=4732} | Export-Clixml -path D:\baselog\addpriv2.xml

#4. Clear event log
Get-WinEvent -FilterHashTable @{LogName="security";id=1102} | Export-Clixml -path D:\baselog\clearevent2.xml

#5.RDP/Terminal cert creation
Get-WinEvent -FilterHashTable @{LogName="system";id=1056}  | Export-Clixml -path D:\baselog\rdp2.xml

#6.Disable Firewall
Get-WinEvent -FilterHashTable @{LogName="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall";id=2003}  | Export-Clixml -path D:\baselog\firewall2.xml

#7.External media
Get-WinEvent -FilterHashTable @{LogName="system";id=7045, 10000, 10001, 10100, 20001, 20002, 20003, 24576, 24577, 24579} | Export-Clixml -path D:\baselog\extmedia2.xml

#8.Lateral movement
Get-WinEvent -FilterHashTable @{LogName="security";id=4624} | Export-Clixml -path D:\baselog\lateralmov2.xml

#9.App whitelisting or software restriction policy
Get-WinEvent -FilterHashTable @{LogName="Microsoft-Windows-Applocker/EXE and DLL";id=8003,8004} | Export-Clixml -path D:\baselog\applist2.xml