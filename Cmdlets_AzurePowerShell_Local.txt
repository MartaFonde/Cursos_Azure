Install-Module -Name Az
Login-AzAccount
Get-AzSubscription 
New-AzResourceGroup -Name Test -Location northeurope 
Get-AzResourceGroup
Remove-AzResourceGroup