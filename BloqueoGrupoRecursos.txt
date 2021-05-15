New-AzResourceLock -LockName "bloqueo" -LockLevel CanNotDelete -ResourceGroup Test

Get-AzResourceLock -ResourceGroupName Test

Remove-AzResourceLock -Name bloqueo -ResourceGroupName Test

Get-help Get-AzResourceLock

Get-help Get-AzResourceLock -examples
