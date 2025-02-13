﻿$CustomExec = @(
    # @{
    #     Name           = "Fix 20DA Touchscreen"
    #     wrkDir         = "C:\Windows\Temp"
    #     FilesToDwnload = @(
    #         @{
    #             FileName = "Install-TS20DAFix.ps1"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-TS20DAFix.ps1"
    #         },
    #         @{
    #             FileName = "iaioi2ce.zip"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/bin/iaioi2ce.zip"
    #         }
    #     )
    #     Execution      = @(
    #         @{
    #             Execute   = "powershell.exe"
    #             Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-TS20DAFix.ps1"
    #         }
    #     )
    #     Detection      = @(
    #         @{
    #             Rule = "[bool](!(Get-WmiObject -Query `"select * from win32_computersystem where model like '20DA%'`")) -or (Get-WmiObject -Query `"select * from win32_PnPSignedDriver where DeviceName like 'I2C Controller'`")"
    #         }
    #     )
    # },
    # @{
    #     Name           = "Upgrade Graphics Driver on Acer BR118-RN"
    #     wrkDir         = "C:\Windows\Temp"
    #     FilesToDwnload = @(
    #         @{
    #             FileName = "Install-HD505Graphics.ps1"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-HD505Graphics.ps1"
    #         },
    #         @{
    #             FileName = "vga6286.zip"
    #             URL      = "http://horten.kommune.no:83/filer/VGA6286.zip"
    #         }
    #     )
    #     Execution      = @(
    #         @{
    #             Execute   = "powershell.exe"
    #             Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-HD505Graphics.ps1"
    #         }
    #     )
    #     Detection      = @(
    #         @{
    #             Rule = "[bool](!(Get-WmiObject -Query `"select * from win32_computersystem where model like 'TravelMate Spin B118-RN'`")) -or ((Get-WmiObject -Query `"select * from win32_PnPSignedDriver where DeviceName like 'Intel(R) HD Graphics'`") | where {`$_.driverversion -ge '24.20.100.6286'})"
    #         }
    #     )
    # },
    # @{
    #     Name           = "Fix camdriver for 20DA v2004"
    #     wrkDir         = "C:\Windows\Temp"
    #     FilesToDwnload = @(
    #         @{
    #             FileName = "Install-CAM20DAFix.ps1"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-CAM20DAFix.ps1"
    #         },
    #         @{
    #             FileName = "20dacam.zip"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/bin/20dacam.zip"
    #         }
    #     )
    #     Execution      = @(
    #         @{
    #             Execute   = "powershell.exe"
    #             Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-CAM20DAFix.ps1"
    #         }
    #     )
    #     Detection      = @(
    #         @{
    #             Rule = "[bool](!(Get-WmiObject -Query `"select * from win32_computersystem where model like '20DA%'`")) -or ((Get-WmiObject -Query `"select * from win32_PnPSignedDriver where DeviceName like 'Integrated Camera'`") | where {`$_.driverversion -eq '3.4.7.37'})"
    #         }
    #     )
    # },
    @{
        Name           = "Enable Wake Timers"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Run-PwrcfgWakeTimers.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Run-PwrcfgWakeTimers.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Run-PwrcfgWakeTimers.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "`$OP = (powercfg /query SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d);[bool](`$OP -like `"*Current AC Power Setting Index: 0x00000001*`") -and (`$OP -like `"*Current DC Power Setting Index: 0x00000001*`")"
            }
        )
    },
    @{
        Name           = "Install uniFlow printer"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Install-UniflowPrinter.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-UniflowPrinter.ps1"
            },
            @{
                FileName = "uniflow_pclxl.zip"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/bin/uniflow_pclxl.zip"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-UniflowPrinter.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS;`$Username = Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username; `$ObjUser = New-Object System.Security.Principal.NTAccount(`$Username);`$SID = `$Objuser.Translate([System.Security.Principal.SecurityIdentifier]) | Select-Object -ExpandProperty Value;[bool]((Get-Printer -Name `"HortenPrintElev`") -and (Test-Path `"HKU:\`$SID\Software\Wow6432Node\NT-Ware\MOMUD`"))"
            }
        )
    },
    @{
        Name           = "Install Print Driver"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Install-UFRIIDriver.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-UFRIIDriver.ps1"
            },
            @{
                FileName = "cnlb0m.zip"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/bin/cnlb0m.zip"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-UFRIIDriver.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "[bool](Get-PrinterDriver -Name `"Canon Generic Plus UFR II`")"
            }
        )
    },
    @{
        Name           = "Set up eksamen printers"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Install-EksamenPrinters.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-EksamenPrinters.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-EksamenPrinters.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "if((Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty Username) -like `"*eksamen*`"){`$Install = `$true}elseif(Get-Printer | Where-Object {@('\\10.85.207.8\2FL02588','\\10.85.207.8\2FL07038','\\10.85.207.8\QLC31644','\\10.85.207.8\XVC08019','\\10.85.207.8\XVF14345','\\10.85.207.8\QNW11407') -contains `$_.Name }) {`$Install = `$true};[bool](!(`$Install -eq `$true))"
            }
        )
    },
    @{
        Name           = "Install Firewall rules"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Set-FirewallRule.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Set-FirewallRule.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Set-FirewallRule.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "`$false"
            }
        )
    },
    @{
        Name           = "Delete Microsoft Teams leagcy icon"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Delete-TeamsIcon.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Delete-TeamsIcon.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Delete-TeamsIcon.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "`$false"
            }
        )
    },
    @{
        Name           = "Disable NBT-NS"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Disable-NBT-NS.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Disable-NBT-NS.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Disable-NBT-NS.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "[bool](!(Get-ItemProperty `"HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\tcpip*`" -Name NetbiosOptions | Where-Object { `$_.NetbiosOptions -ne 2 }))"
            }
        )
    },
    @{
        Name           = "Enable High Performance Mode"
        wrkDir         = "C:\Windows\Temp"
        FilesToDwnload = @(
            @{
                FileName = "Set-HighPerfmode.ps1"
                URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Set-HighPerfmode.ps1"
            }
        )
        Execution      = @(
            @{
                Execute   = "powershell.exe"
                Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Set-HighPerfmode.ps1"
            }
        )
        Detection      = @(
            @{
                Rule = "[bool](!(Test-Path -Path `"C:\Program Files\Lingdys4\lingx.exe`"))"              
            }
        )
    }
    # @{
    #     Name           = "Install Language Capabilities"
    #     wrkDir         = "C:\Windows\Temp"
    #     FilesToDwnload = @(
    #         @{
    #             FileName = "Install-LangPacks.ps1"
    #             URL      = "https://raw.githubusercontent.com/Hortenkommune/ContinuousDelivery4Intune/master/resources/scripts/Install-LangPacks.ps1"
    #         }
    #     )
    #     Execution      = @(
    #         @{
    #             Execute   = "powershell.exe"
    #             Arguments = "-ExecutionPolicy Bypass -File C:\Windows\Temp\Install-LangPacks.ps1"
    #         }
    #     )
    #     Detection      = @(
    #         @{
    #             Rule = "`$false"
    #         }
    #     )
    # }
)

$CustomExec | ConvertTo-Json -Depth 4 -Compress | Out-File "$PSScriptRoot\config.json" -Encoding default