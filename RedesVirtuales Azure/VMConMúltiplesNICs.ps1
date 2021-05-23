#Crea red virtual y subred (ya asociadas)
az network vnet create --resource-group demo-vnet --name myVnet --address-prefix 10.0.0.0/16 --subnet-name mySubnetFrontEnd --subnet-prefix 10.0.1.0/24

az network vnet subnet create --resource-group demo-vnet --vnet-name myVnet --name mySubnetBackEnd --address-prefix 10.0.2.0/24

#Regla/grupo de seguridad asociada a la red
az network nsg create --resource-group demo-vnet --name myNetworkSecurityGroup
#Creación interfaces
az network nic create --resource-group demo-vnet --name myNic1 --vnet-name myVnet --subnet mySubnetFrontEnd --network-security-group myNetworkSecurityGroup
az network nic create --resource-group demo-vnet --name myNic2 --vnet-name myVnet --subnet mySubnetBackEnd --network-security-group myNetworkSecurityGroup

az vm create --resource-group demo-vnet --name myVM --image UbuntuLTS --size Standard_DS3_v2 --admin-username azureuser --generate-ssh-keys --nics myNic1 myNic2