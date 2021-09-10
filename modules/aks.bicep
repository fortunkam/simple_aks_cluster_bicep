param name string
param location string
param subnetId string
@secure()
param keyData string


resource aks 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: name
  location: location
  properties: {
    dnsPrefix: name
    agentPoolProfiles: [
      {
        count: 1
        vmSize: 'Standard_D2_v2'
        vnetSubnetID: subnetId
        name: 'default'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: 'AzureAdmin'
      ssh: {
        publicKeys: [
          {
            keyData: keyData
          }
        ]
      }
    }
    networkProfile: {
      networkPlugin: 'azure'
      loadBalancerSku: 'standard'
      dnsServiceIP: '172.16.0.10'
      serviceCidr: '172.16.0.0/16'
      dockerBridgeCidr: '172.18.0.1/16'
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}
