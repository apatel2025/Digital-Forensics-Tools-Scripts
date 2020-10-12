#Powershell script creates output files using various commands to form a baseline.

get-hotfix | Export-Clixml -path C:\BaseL\hotfix1.xml

get-wmiobject -query "SELECT * FROM Win32_Product" -computername B2319-0004 | sort-object InstallDate| 
select-object PSComputerName,Vendor,Name,Version,InstallDate,InstallLocation,InstallSource,PackageName |
export-clixml -path C:\BaseL\instSoft1.xml

get-service | Sort-Object Name | Get-Unique -AsString | Export-Clixml -Path C:\BaseL\runServ1.xml #AsString considers the service names as a string.

get-Process | Export-Clixml -Path C:\BaseL\runProc1.xml

Get-NetTCPConnection -State Established | Export-Clixml -path C:\BaseL\netconn1.xml

Get-NetUDPEndpoint | Export-Clixml -Path C:\BaseL\udpconn1.xml