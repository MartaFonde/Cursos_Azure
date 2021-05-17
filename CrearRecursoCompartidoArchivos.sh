
$resourceGroupName = "demo-storage-portal"
$storageAccountName = "demostorageportalprueba"
$fileShareName = "compartido"

#Create a file share (PowerShell)
	#1.Gather the storage account name and the storage account key
	Get-AzStorageAccount | fl *name*
	Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName

	#2.Retrieve an access key for your storage account
	$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName

	#3.Create a context for your storage account and key. The context encapsulates the storage account name and account key
	$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKeys[0].value

	#4.Create the file share. The name of your file share must be all lowercase.
	$share = New-AzStorageShare $fileShareName -Context $storageContext

#Create a file share (PowerShell)
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName 
$fileShare = Get-AzStorageShare -Context $storageAccount.Context | Where-Object {
	$_.Name -eq $fileShareName -and $_.IsSnapshot -eq $false
}

if ($fileShare -eq $null) {
	throw [System.Exception]::new("Azure file share not found")
}

$password = ConvertTo-SecureString -String $storageAccountKeys[0].Value -AsPlainText -Force
$credential = New-Object System.Management.Automation.PsCredential -ArgumentList "AZURE\$($storageAccount.StorageAccountName)", $password

New-PSDrive -Name Z -PSProvider FileSystem -Root "\\$($fileShare.StorageUri.PrimaryUri.Host)\$($fileShare.Name)" -Credential $credential -Persist

Remove-PSDrive -Name Z