Write-Host "####################################"
Write-Host "### CREATE NEW PROJECT DIRECTORY ###"
Write-Host "####################################"

$projNumber = Read-Host "Enter Project Number " -Verbose
$projLocation = Read-Host "Enter Project Location " -Verbose
$projClient = Read-Host "Enter Client Name " -Verbose

$projDir = $projNumber+"_"+$projLocation+"_"+$projClient

New-Item -Type Directory -Path E:\ -Name $projDir -Verbose
Echo "Folder Created"

#New-Item -Type Directory -Path E:\$projDir -Name RENDER 
1..4 | ForEach-Object {New-Item -Type Directory -Path E:\$projDir -Name RENDER\CGI0$_}
New-Item -Type Directory -Path E:\$projDir -Name SCENES\MAPS
New-Item -Type Directory -Path E:\$projDir -Name SOURCE

#Create the project folder on the server

New-Item -ItemType Directory -Path '\\192.168.17.239\Visualization\02 - Simeon\' -Name $projDir -Verbose

Write-Host 
Write-Host "***/TEMP QUERY***"
Write-Host 

$tempFolder = "\\192.168.17.239\Temp\Simo"
Get-ChildItem -path $tempFolder
Write-Host 
Write-Host 
$selFolder = Read-Host("***SELECT FOLDER***") 
$finalFolder = Get-Item -Path $tempFolder\*$selFolder*
$finalFolder
$finalFolder.count

#Pull files from TEMP to PROJECT\SOURCE folder

Test-Path $finalFolder

pause

Copy-Item -Path $finalFolder\* -Destination e:\$projDir\SOURCE -Recurse -Verbose

pause