Login-AzAccount

#Install-Module -Name Az.ConnectedMachine

$sqlMachines = Get-AzConnectedMachine | Where-Object {$_.MssqlDiscovered -eq $true}
$extensionStatusList = @()

foreach($sqlMachine in $sqlMachines){
    $sqlextension = $null
    $sqlextension = Get-AzConnectedMachineExtension -ResourceGroupName $sqlMachine.ResourceGroupName -MachineName $sqlMachine.Name | Where-Object {$_.Name -eq 'WindowsAgent.SqlServer'}
    $currentLicenseState = $sqlextension.Setting["LicenseType"]

    #add original arc machine name and the current license type setting so we can see what needs adjusted
    $sqlextension | Add-Member -MemberType NoteProperty -Name "MachineName" -Value $sqlMachine.Name
    $sqlextension | Add-Member -MemberType NoteProperty -Name "CurrentLicenseType" -Value $currentLicenseState

    $extensionStatusList += $sqlextension
}

$extensionStatusList | Select-Object MachineName, ResourceGroupName, Name, Location, TypeHandlerVersion, ProvisioningState, CurrentLicenseType | Format-Table
