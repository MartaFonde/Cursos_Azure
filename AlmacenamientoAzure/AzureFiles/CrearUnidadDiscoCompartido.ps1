#Retrieve storage account and storage account key
$storageContext = New-AzStorageContext <storage-account-name> <storage-account-key>
#Create the file share, in this case "logs"
$share = New-AzStorageShare logs -Context $storageContext