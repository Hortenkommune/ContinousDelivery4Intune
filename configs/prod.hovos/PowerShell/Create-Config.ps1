﻿$PowerShell = @(
    @{
        Name      = "Disable Restart-Computer every night"
        Command   = "Get-ScheduledTask -TaskName 'Nightly Reboot' | Disable-ScheduledTask"
        Detection = "[bool](Get-ScheduledTask -TaskName 'Nightly Reboot' | Where-Object {`$_.State -eq 'Disabled'})"
    },
    @{
        Name      = "Remove desktop.ini from OneDrive"
        Command   = "New-Variable Username -Value (Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username); Set-Variable Username -Value (`$Username -replace 'SKOLE\\', ''); Remove-Item ('C:\Users\' + `$Username + '\OneDrive - Horten kommune\desktop.ini') -Force"
        Detection = "`$Username = (Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username); `$Username = `$Username -replace `"SKOLE\\`",`"`";[bool](!(Test-Path `"C:\Users\`$Username\OneDrive - Horten kommune\desktop.ini`"))"
    }
)
$PowerShell | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default