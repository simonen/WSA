Write-Host "####################################################"
Write-Host "####COPY THE JPGs FROM LOCAL TO SERVER DIRECTORY####" -ForegroundColor Cyan
Write-Host "####################################################"
Write-Host
$number = Read-Host "Enter project number"
$serverDir = '\\192.168.17.239\Visualization\02 - Simeon'
$projectName = $(Get-ChildItem -Path $serverDir\$number*)
Write-Host ""
Write-Host "COPYING FILES FROM: $(get-childitem -Path e:\$number*) TO: $projectName\"
Write-Host ""
Copy-Item -Path e:\$number*\*.jpg -Destination $projectName -Verbose
Write-Host 
Write-Host '***'$(get-childitem -Path e:\$number*\*.jpg).count 'ITEMS COPIED ***'
Write-Host 
Write-Host "**** $projectName **** COPIED TO CLIPBOARD ****" 
Write-Host 
Set-Clipboard -Value "$projectName"
pause

