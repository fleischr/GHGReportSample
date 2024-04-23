const factoryaddress = ""
const factoryabi = [
  {
    "inputs": [],
    "name": "createNFT",
    "outputs": [
      {
        "internalType": "contract emissionsNFT",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  }
]

const orgabi = [
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_to",
        "type": "address"
      }
    ],
    "name": "mintEmissionsNFT",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint32",
        "name": "_targetToken",
        "type": "uint32"
      },
      {
        "internalType": "uint256",
        "name": "_fromDateTime",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_toDateTime",
        "type": "uint256"
      },
      {
        "internalType": "int256",
        "name": "_co2eAmount",
        "type": "int256"
      },
      {
        "internalType": "address",
        "name": "_emissionsOrigin",
        "type": "address"
      },
      {
        "internalType": "bytes32",
        "name": "_publicIPFSCID",
        "type": "bytes32"
      },
      {
        "internalType": "bytes32",
        "name": "_protectedIPFSCID",
        "type": "bytes32"
      },
      {
        "internalType": "bytes32",
        "name": "_sapcapDataHash",
        "type": "bytes32"
      },
      {
        "internalType": "string",
        "name": "_emissionsVaultID",
        "type": "string"
      },
      {
        "internalType": "string",
        "name": "_ghgOrgID",
        "type": "string"
      },
      {
        "internalType": "enum iEmissionsNFT.carbonScopeLevel",
        "name": "_scopeLevel",
        "type": "uint8"
      }
    ],
    "name": "addEmissionsData",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  }
]


module.exports = { factoryaddress, factoryabi, orgabi }