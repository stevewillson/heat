$ErrorActionPreference = 'SilentlyContinue'

Remove-Item C:\windows\system32\setup1.ps1 -force
start-sleep -s 1

Remove-Item C:\windows\system32\setup2.ps1 -force
start-sleep -s 1

restart-computer