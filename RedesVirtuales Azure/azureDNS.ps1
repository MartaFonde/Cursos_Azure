$zone = Get-AzDnsZone -Name "azurebrainsprueba.com" -ResourceGroupName Azurebrains

Get-AzDnsRecordSet -ResourceGroupName Azurebrains -ZoneName "azurebrainsprueba.com"
#Información nombre registro de los servidores
Get-AzDnsRecordSet -Name "@" -RecordType NS -Zone $zone