#------------------------------------------------------------------------------
# Description: This Script displays current running process and valuable information
#              about it.
#
# Parameters:  none
#
#
# Author: A. Patel
# Date: 2018-07-13               
#------------------------------------------------------------------------------

#importing all the modules required 
import wmi
import win32con
import win32api
import win32security
import os

wmi_obj = wmi.WMI (privileges=["Security"])

#creating the process watcher
process_watcher = wmi_obj.Win32_Process.watch_for("creation")

#creating a loop that keeps printing details for each process launched
while True:
	new_process = process_watcher()
	print "The Process name is:",new_process.Caption
	print "The CommandLine:",new_process.CommandLine 
	print "The Executable path:" ,new_process.ExecutablePath 
	print "The Date of creation:",new_process.CreationDate
	print "Thread count:",new_process.ThreadCount 
	print "Process Owner:", new_process.GetOwner() 
	print "The ProcessID:", new_process.ProcessID 
	print "The Parent PID:" , new_process.ParentProcessID
	
#assigning required variables for the privileges	
	process = win32api.OpenProcess(win32con.PROCESS_QUERY_INFORMATION, False,new_process.ProcessID)

	token = win32security.OpenProcessToken(process,win32con.TOKEN_QUERY)
	
	privileges = win32security.GetTokenInformation(token,win32security.TokenPrivileges)

	for TokenPrivileges in privileges:
		if TokenPrivileges[1] == 3:
			win32security.LookupPrivilegeName(None,TokenPrivileges[0])
			print TokenPrivileges
