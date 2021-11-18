get-counter "\Processor(_Total)\% Processor Time" | ForEach-Object {$_.Timestamp.ToString() + ' => ' + $_.CounterSamples.CookedValue[0] } | Out-File -FilePath 'C:\Temp\CPU.log' -Append -Force