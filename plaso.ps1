#Plaso Tools
#Description: This script uses the plaso CLI tools to create files and sort them in a timeline using various filters and parsers.
#Author: Aditya Patel
#Version: 1
#Date: November 28th 2019

Write-Host "`r`nKitchensink Collection`r`n" -ForegroundColor Green
$imagepath = Read-Host ("Enter the path to the forensic image") 
$outputfile = Read-host ("Mention a path and name for the output file") 



Write-Host "`r`nTrageted Collection`r`n" -ForegroundColor Green
$filterpath = Read-Host ("Enter the path to the filter you would like to use") 
$plasofile = Read-Host ("Enter a name for the output plaso file") 

E:\CF_test\plaso-64\log2timeline.exe -f $filterpath $plasofile $imagepath  

Write-host "`r`nSorting`r`n" -ForegroundColor Green
$outputfile = Read-Host ("Enter a name for csv file") 

E:\CF_test\plaso-64\psort.exe -o l2tcsv -w $outputfile $plasofile 

Write-Host "`r`nUsing Parsers`r`n" -ForegroundColor Green
$parserpath = Read-Host ("Enter the path to the parser you would like to use") 
$plasofile = Read-Host ("Enter a name for the output plaso file") 
E:\CF_test\plaso-64\log2timeline.exe --parsers $parserpath $plasofile $imagepath 

Write-host "`r`nSorting the new plaso file`r`n" -ForegroundColor Green
$outputfile = Read-Host ("Enter a name for csv file") 
E:\CF_test\plaso-64\psort.exe -o l2tcsv -w $outputfile $plasofile
