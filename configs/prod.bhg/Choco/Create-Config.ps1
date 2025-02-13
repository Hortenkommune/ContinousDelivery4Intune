﻿$ChocoPkgs = @(
    @{
        Name = "googlechrome"
        Mode = "uninstall"
    },
    @{
        Name = "paint.net"
        Mode = "Install"
    },
    @{
        Name = "vlc"
        Mode = "Install"
    },
    @{
        Name = "sccmtoolkit"
        Mode = "install"
    },
    @{
        Name = "dotnet3.5"
        Mode = "install"
    },
    @{
        Name = "dotnet"
        Mode = "install"
    }
)
$ChocoPkgs | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default