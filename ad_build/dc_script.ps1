$ErrorActionPreference = 'SilentlyContinue'

Add-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName testing.local -InstallDNS

# now need to set a password for the Administrator user
# need to also specify the DRSM password
