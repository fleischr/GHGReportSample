const { Transaction } = require("thor-devkit");

var vechain_utils = {
    mintEmissionsNFT : async function () {
        console.log('minting emissions NFT...');
        //todo get clauses
        
        //build transaction
        const transaction = this.buildTransaction([]);
        
        // todo simulate
        
        // todo test for errors
        
        // todo fee delegation (ppbly option tbh)
        
        // sign the transaction
        const signingHash = transaction.signingHash();
        //const originSignature = secp256k1.sign(signingHash, Buffer.from(wallet.privateKey.slice(2), 'hex'));
        //transaction.signature = Buffer.concat([originSignature.signature, sponsorSignature]);

        //submit transaction
        const rawTransaction = `0x${transaction.encode().toString('hex')}`;
        // submit transaction pt 2
        //const { id } = await post('/transactions', { raw: rawTransaction });
        //console.log('Submitted with txId', id);
    },
    
    addEmissionsData : async function (){
    
    },
    
    buildTransaction : async function (clauses) {
        // build the transaction
        const bestblock = await this.getBestBlock();
        const transaction = new Transaction({
            chainTag: Number.parseInt(genesisBlock.id.slice(-2), 16),
            blockRef: bestblock.id.slice(0, 18),
            expiration: 32,
            clauses,
            gas: bestblock.gasLimit,
            gasPriceCoef: 0,
            dependsOn: null,
            nonce: Date.now(),
            reserved: {
                features: 1
            }
        });
        return transaction;
    },

    getBestBlock : async function () {
        const thorestapi = await cds.connect.to('thorest');
        const bestblock  = thorestapi.send({
            method: 'GET',
            path: '/blocks/best'
        });
        return bestblock;
    }
};

module.exports = vechain_utils;

