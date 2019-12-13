﻿$Versions = @(
    @{
        Name    = "prod.bs"
        Version = "1.0.5"
    },
    @{
        Name    = "prod.us"
        Version = "1.0.5"
    },
    @{
        Name    = "prod.hovos"
        Version = "1.0.5"
    },
    @{
        Name    = "prod.bhg"
        Version = "1.0.6"
    },
    @{
        Name    = "prod.bakk"
        Version = "1.0.5"
    },
    @{
        Name    = "beta"
        Version = "1.0.9"
    },
    @{
        Name    = "tekno"
        Version = "1.0.5"
    }
)
$Versions | ConvertTo-Json -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default