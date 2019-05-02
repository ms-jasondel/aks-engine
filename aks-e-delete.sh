# Deletes all resources in a given $1 resource group.
rg=${1?Need Resource Group}
echo "About to delete all resources in $rg..."
az group deployment create --resource-group $rg --mode Complete --template-file empty.json