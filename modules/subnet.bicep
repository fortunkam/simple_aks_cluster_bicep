param name string
param addressPrefix string
param vnetName string

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: '${vnetName}/${name}'
  properties: {
    addressPrefix: addressPrefix
  }
}

output id string = subnet.id
