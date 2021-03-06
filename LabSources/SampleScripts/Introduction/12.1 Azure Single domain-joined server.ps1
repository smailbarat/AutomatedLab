#Same as '04 Single domain-joined server.ps1' but targeting Azure.
#
#Here AL installs a lab with one domain controller and one client. The OS can be configured quite easily as well as
#the domain name or memory. AL takes care about network settings like in the previous samples.

$azureResourceManagerProfile = '<PATH TO YOUR AZURE RM PROFILE>' #IF YOU DO NOT HAVE A PROFILE FILE, CALL Save-AzureRmContext
$azureDefaultLocation = 'West Europe' #COMMENT OUT -DefaultLocationName BELOW TO USE THE FASTEST LOCATION

New-LabDefinition -Name 'AzureLab1' -DefaultVirtualizationEngine Azure

Add-LabAzureSubscription -Path $azureResourceManagerProfile -DefaultLocationName $azureDefaultLocation

Add-LabMachineDefinition -Name azDC1 -Memory 1GB -OperatingSystem 'Windows Server 2012 R2 SERVERDATACENTER' -Roles RootDC -DomainName contoso.com
Add-LabMachineDefinition -Name azClient1 -Memory 1GB -OperatingSystem 'Windows Server 2012 R2 SERVERDATACENTER' -DomainName contoso.com

Install-Lab

Show-LabDeploymentSummary -Detailed
