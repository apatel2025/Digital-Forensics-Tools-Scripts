#USB
Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational";id=13} | Where-Object {$_.Message -like "* HKLM\SOFTWARE\Microsoft\Windows Portable Devices\*"} | Export-Clixml -Path D:\sysmlog\usb1.xml

#name and file path, property number can vary you can also supply multiple
Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational";id=1} |  %{$_.Properties[4].Value} |  Export-Clixml -Path D:\sysmlog\namepath1.xml

#once you find the suspicious files name, track it
Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational";id=1} | Where-Object {$_.Message -like "*.exe*"} |  Export-Clixml -Path D:\sysmlog\exetrack.xml

#get whatever field you want together
#Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational";id=1} | Where-Object {$_.Message -like "*.exe*"} |  %{$_.Properties[2,3,4,12,21].Value} |  Export-Clixml -Path D:\sysmlog\usb.xml

#search using ProcessGUID
#get-winevent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational";} -oldest | Where-Object {$_.Message -like "**"} |  Export-Clixml -Path D:\sysmlog\usb.xml

#time related events
#get-winevent -filterhashtable @{logname="Microsoft-Windows-Sysmon/Operational"; StartTime="10/29/2019 5:45:00 PM"; EndTime = "M" } |  Export-Clixml -Path D:\sysmlog\usb.xml

#firewall rule changed?
#get-winevent -filterhashtable @{logname="Microsoft-Windows-Windows Firewall with Advanced Security/Firewall";id=2004,2006; StartTime=""} |  Export-Clixml -Path D:\sysmlog\usb.xml

#anti virus events 
get-winevent -filterhashtable @{logname="Microsoft-Windows-Windows Defender/Operational";id=5000,5001;} |  Export-Clixml -Path D:\sysmlog\av1.xml

#also | select-object -ExpandProperty Message | select-string " " does a quick/simple string search 
