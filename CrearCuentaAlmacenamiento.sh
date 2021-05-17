#Login and select subscription
Connect-AzAccount
Set-AzContext -Subscription XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

#Select location
Get-AzLocation | select Location
$location = "northeurope"

#Create new Resource Group
New-AzResourceGroup -Name demo-storage-ps -Location $location
$resourceGroup = "demo-storage-ps"

#Create a new Storage Account
New-AzStorageAccount -ResourceGroupName $resourceGroup -Name "storagedemops" -Location $location -SkuName Standard_LRS -Kind StorageV2