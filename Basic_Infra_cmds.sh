RG='AZB25-HUBRG'

az group create -l eastus -n $RG

az network vnet create -g $RG -n $RG-vNET1 --address-prefix 10.25.0.0/16 \
    --subnet-name $RG-subnet-1 --subnet-prefix 10.25.1.0/24 --location eastus --dns-servers 10.25.1.100

az network vnet subnet create -g $RG --vnet-name $RG-vNET1 -n $RG-subnet-2 \
    --address-prefixes 10.25.2.0/24

az network vnet subnet create -g $RG --vnet-name $RG-vNET1 -n AzureFirewallSubnet \
    --address-prefixes 10.25.10.0/24

az vm create --resource-group $RG --name MGMTVM1 --image win2019Datacenter --vnet-name $RG-vNET1 \
    --subnet $RG-Subnet-1 --admin-username testuser --admin-password "Kiran@9391598915" --size standard_B2ms \
    --nsg ""

az vm create --resource-group $RG --name LINUXVM1 --image UbuntuLTS --vnet-name $RG-vNET1 \
    --subnet $RG-Subnet-2 --admin-username testuser --admin-password "Kiran@9391598915" --size standard_B1s \
    --nsg ""
