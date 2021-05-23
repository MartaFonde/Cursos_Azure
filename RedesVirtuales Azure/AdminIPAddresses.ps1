#Obtenemos el Nic1. IPConfigurations -> Static/Dinamic. DnsSettings
Get-AzNetworkInterface -Name myNic1 -ResourceGroupName demo-vnet

$nic = Get-AzNetworkInterface -Name myNic1 -ResourceGroupName demo-vnet
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Dynamic" #Cambio en el objeto local

#Para establecer el cambio en Azure
Set-AzNetworkInterface -NetworkInterface $nic