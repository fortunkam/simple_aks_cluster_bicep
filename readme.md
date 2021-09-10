# Simple AKS Cluster deploy using Bicep

Deploy a single node AKS cluster connected to a vnet with a managed identity

The main bicep file takes the following parameters

- **namePrefix** - a Prefix that will be applied to the aks and vnet resources
- **keyData** - SSH public key value for the linux nodes, this can be generated using the following command (I used Ubuntu on WSLv2) `ssh-keygen -q -t rsa -b 4096 -N '' -f aksKey`


Can be deployed using `az deployment group create -g "aks_simple" --template-file ".\main.bicep" --parameters keyData='{YOUR_PUBLIC_KEY}'`