#Login and select subscription
az login
az account set
	--subscription XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

#Create new Resource Group
az group create --name demo-storage-cli --location EastUS

#Select location
az account list-locations
	--query "[].{Region:name}"
	--out table

#Create a new Storage Account
az storage account create --name storagedemocli --resource-group demo-storage-cli --location EastUS --sku Standard_LRS --kind StorageV2