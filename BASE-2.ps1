#Powershell script creates output files using various commands to form a baseline.

get-hotfix | Export-Clixml -path C:\BaseL\hotfix2.xml

get-wmiobject -query "SELECT * FROM Win32_Product" -computername B2319-0004 | sort-object InstallDate| 
select-object PSComputerName,Vendor,Name,Version,InstallDate,InstallLocation,InstallSource,PackageName |
export-clixml -path C:\BaseL\instSoft2.xml

#AsString considers the service names as a string.

get-service | Sort-Object Name | Get-Unique -AsString | Export-Clixml -Path C:\BaseL\runServ2.xml

get-Process | Export-Clixml -Path C:\BaseL\runProc2.xml

Get-NetTCPConnection -State Established | Export-Clixml -path C:\BaseL\netconn2.xml

Get-NetUDPEndpoint | Export-Clixml -Path C:\BaseL\udpconn2.xml