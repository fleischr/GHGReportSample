import { Transaction } from "thor-devkit";

var vechain_utils = {
    mintEmissionsNFT : async function () {

    },
    
    addEmissionsData : async function (){
    
    },
    
    buildTransaction : function (clauses) {
        // build the transaction
        const transaction = new Transaction({
            chainTag: Number.parseInt(genesisBlock.id.slice(-2), 16),
            blockRef: bestBlock.id.slice(0, 18),
            expiration: 32,
            clauses,
            gas: bestBlock.gasLimit,
            gasPriceCoef: 0,
            dependsOn: null,
            nonce: Date.now(),
            reserved: {
                features: 1
            }
        });
    }
};

module.exports = vechain_utils;

