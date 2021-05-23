$myVNet1 = New-AzVirtualNetwork -ResourceGroupName demo-vnet -Location 'North Europe' -Name myVNet1 -AddressPrefix 10.0.0.0/16 

Get-AzVirtualNetwork -Name myVNet1

$mySubNet1 = Add-AzVirtualNetworkSubnetConfig -Name mySubNet1 -AddressPrefix 10.0.0.0/24 -VirtualNetwork $myVNet1

Get-AzVirtualNetworkSubnetConfig -Name mySubNet1 -VirtualNetwork $myVNet1

#Asociar la subred a la red virtual. Es necesario
$mySubNet1 | Set-AzVirtualNetwork