<#
    # Pre-Requisites VMware PowerCLI:
    Find-Module -name vmware.powercli
    Install-Module -name vmware.powercli
    Get-Module vmware* -ListAvailable
#>

# Elevate to domain administrator
$cred = Get-Credential

$vSphereWildCard = Read-Host

# Get vSphere Servers
$vsphere_servers = @(Get-ADComputer -Filter "Name -like '$vsphereWildCard'")

# Connect to vSphere Servers
connect-viserver $vsphere_servers.name -credential $cred

# Get VMs
$vms = Get-VM
