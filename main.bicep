param namePrefix string = 'mf'

@secure()
param keyData string

var aksName = '${namePrefix}aks'
var vnetName = '${namePrefix}vnet'
var subnetName = 'aks'

module vnet './modules/vnet.bicep' = {
  name: 'vnet'
  params: {
    name: vnetName
    location: resourceGroup().location
    addressPrefixes: [
      '10.0.0.0/16'
    ]
  } 
}

module aksSubnet './modules/subnet.bicep' = {
  name: 'aksSubnet'
  params: {
    name: subnetName
    addressPrefix: '10.0.0.0/24'
    vnetName: vnet.outputs.vnetName
  } 
}

module aks './modules/aks.bicep' = {
  name: 'aks'
  params: {
    name: aksName
    location: resourceGroup().location
    subnetId: aksSubnet.outputs.id
    keyData: keyData
  } 
}
