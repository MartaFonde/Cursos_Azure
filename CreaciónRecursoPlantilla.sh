#Plantilla:
#https://github.com/Azure/azure-quickstart-templates/tree/master/101-vm-simple-windows
#Implementación a partir de portal -> Deploy to Azure

Connect-AzAccount
Get-AzContext
#Set-AzContext -subscription ID

New-AzResourceGroup -Name SimpleVM -Location northeurope

#Creamos una variable para la URI de la plantilla:
$templateUri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-windows/azuredeploy.json"

New-AzResourceGroupDeployment -Name VM01 -ResourceGroupName SimpleVM -TemplateUri $templateUri

Get-AzVM -ResourceGroupName SimpleVM

#Cambios solución implementada: (Cambio imperativo)
$vm = Get-AzVM -ResourceGroupName SimpleVM -Name simple-vm
$vm.HardwareProfile.vmSize = "Standard_A3"