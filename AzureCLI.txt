Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
az 
az --version
az login
az group create --name TestCLI --location northeurope
az group list
az group list -o table
az group list --query "[?name =='TestCLI']"
az group delete --name "TestCLI"