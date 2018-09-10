$regfiles = @(
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/DontDisplayLastUsername.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`" -Name dontdisplaylastusername) -eq 0)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/DisableFileSyncNGSC.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Policies\Microsoft\Windows\OneDrive`" -Name DisableFileSyncNGSC) -eq 0)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/SilentAccountConfig.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Policies\Microsoft\OneDrive`" -Name SilentAccountConfig) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/FilesOnDemand.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Policies\Microsoft\OneDrive`" -Name FilesOnDemandEnabled) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/DisableFirstRunIE.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"HKLM:\Software\Microsoft\Internet Explorer\Main`" -Name DisableFirstRunCustomize) -eq 1)"
        Type = "HKLM"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/ShownFileFmtPrompt.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\Office\16.0\Common\General -Name ShownFileFmtPrompt) -eq 1)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/RemoveClarifyRun.reg"
        detection = "[bool](`$False)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/TrustedSites.reg"
        detection = "[bool](Test-Path -Path `"REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\kommune.no\adfs.horten`")"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/EnableADAL.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path REGISTRY::HKEY_USERS\.DEFAULT\Software\Microsoft\OneDrive -Name EnableADAL) -eq 1)"
        Type = "HKCU"
    },
    @{
        URL = "https://raw.githubusercontent.com/Forsbakk/Continuous-delivery-for-Intune/master/regfiles/ConnectionsTab.reg"
        detection = "[bool]((Get-ItemPropertyValue -Path `"REGISTRY::HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Internet Explorer\Control Panel`" -Name ConnectionsTab) -eq 1)"
        Type = "HKCU"
    }
)
$regfiles | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default