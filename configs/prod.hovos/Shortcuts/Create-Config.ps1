﻿$Shortcuts = @(
    @{
        Name            = "Google Earth"
        Type            = "lnk"
        Path            = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        Arguments       = "https://earth.google.com/web"
        WorkingDir      = "C:\Program Files (x86)\Google\Chrome\Application"
        IconFileandType = "C:\Windows\ICO\google_earth.ico"
        Description     = "Google Earth Cloud"
        Mode            = "Install"
    },
    @{
        Name            = "Office 365"
        Type            = "lnk"
        Path            = "C:\Windows\explorer.exe"
        Arguments       = "microsoft-edge:`"https://portal.office.com`""
        WorkingDir      = ""
        IconFileandType = "C:\Windows\ICO\Office_portal.ico"
        Description     = "Office 365"
        Mode            = "Install"
    },
    @{
        Name            = "Microsoft Teams Nettleser"
        Type            = "lnk"
        Path            = "C:\Windows\explorer.exe"
        Arguments       = "microsoft-edge:`"https://teams.microsoft.com`""
        WorkingDir      = ""
        IconFileandType = "C:\Windows\ICO\Teams.ico"
        Description     = "Microsoft Teams Nettleser"
        Mode            = "Install"
    },
    @{
        Name            = "Microsoft Teams"
        Type            = "lnk"
        Path            = "C:\Windows\explorer.exe"
        Arguments       = "microsoft-edge:`"https://teams.microsoft.com`""
        WorkingDir      = ""
        IconFileandType = "C:\Windows\ICO\Teams.ico"
        Description     = "Microsoft Teams"
        Mode            = "Uninstall"
    },
    @{
        Name            = "Word"
        Type            = "lnk"
        Path            = "C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe"
        WorkingDir      = "C:\Program Files (x86)\Microsoft Office\root\Office16\"
        IconFileandType = "C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe, 0"
        Description     = "Word 2016"
        Mode            = "Install"
    },
    @{
        Name            = "Excel"
        Type            = "lnk"
        Path            = "C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe"
        WorkingDir      = "C:\Program Files (x86)\Microsoft Office\root\Office16\"
        IconFileandType = "C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe, 0"
        Description     = "Excel 2016"
        Mode            = "Install"
    },
    @{
        Name            = "PowerPoint"
        Type            = "lnk"
        Path            = "C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe"
        WorkingDir      = "C:\Program Files (x86)\Microsoft Office\root\Office16\"
        IconFileandType = "C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe, 0"
        Description     = "PowerPoint 2016"
        Mode            = "Install"
    },
    @{
        Name            = "Veiledninger"
        Type            = "lnk"
        Path            = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        Arguments       = "https://info.hortenskolen.no"
        WorkingDir      = "C:\Program Files (x86)\Google\Chrome\Application"
        IconFileandType = "C:\Windows\System32\imageres.dll, 76"
        Description     = "Diverse veiledinger"
        Mode            = "Install"
    },
    @{
        Name            = "Microsoft Onedrive"
        Type            = "lnk"
        Path            = "C:\Windows\explorer.exe"
        Arguments       = "microsoft-edge:`"https://hortenkommune365-my.sharepoint.com/`""
        WorkingDir      = ""
        IconFileandType = "C:\Windows\ICO\Onedrive.ico"
        Description     = "Microsoft Onedrive"
        Mode            = "Install"
    }
)
$Shortcuts | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default