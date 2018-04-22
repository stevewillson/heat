$ErrorActionPreference = 'SilentlyContinue'
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisabledComponents -Value 0XFFFFFFFF -PropertyType DWord | Out-Null
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath 'C:\Windows\NTDS' `
-DomainMode '7' `
-DomainName 'army.warriors' `
-DomainNetbiosName 'ARMY' `
-ForestMode '7' `
-SafeModeAdministratorPassword (ConvertTo-SecureString -String 'PassWord12345!!' -AsPlainText -Force) `
-InstallDns:$true `
-LogPath 'C:\Windows\NTDS' `
-NoRebootOnCompletion:$true `
-SysvolPath 'C:\Windows\SYSVOL' `
-Force:$true
Set-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -name "setup1" 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -noprofile -sta -File "C:\windows\system32\Setup1.ps1"'
Restart-Computer -Force