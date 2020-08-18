﻿$regfiles = @(
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/DontDisplayLastUsername.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`" -Name dontdisplaylastusername) -eq 0)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/SilentAccountConfig.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Policies\Microsoft\OneDrive`" -Name SilentAccountConfig) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/DisableFirstRunIE.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Microsoft\Internet Explorer\Main`" -Name DisableFirstRunCustomize) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL       = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/LanmanWorkstation.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters`" -Name AllowInsecureGuestAuth) -eq 1)"
        Type      = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/ShownFileFmtPrompt.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\Office\16.0\Common\General -Name ShownFileFmtPrompt) -eq 1)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/RemoveClarifyRun.reg"
        detection = "[bool](`$False)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/RemoveTeamsRun.reg"
        detection = "[bool](`$False)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/TrustedSites.reg"
        detection = "[bool](Test-Path -Path `"REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\kommune.no\adfs.horten`")"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/EnableADAL.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\OneDrive -Name EnableADAL) -eq 1)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/ConnectionsTab.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"REGISTRY::HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Internet Explorer\Control Panel`" -Name ConnectionsTab) -eq 1)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/Telemetry.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection`" -Name CommercialID) -eq e4681353-10f5-4a75-a15b-a1dd7ef23bfa)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/SetPowerPoliciesHp.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4`" -Name DCSettingIndex) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/regfiles/HideShutDown.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start`" -Name HideShutDown) -eq 0)"
        Type = "HKLM"
    }
)
$regfiles | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default