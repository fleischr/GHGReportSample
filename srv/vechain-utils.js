const { ethers } = require("ethers");
const { Transaction, secp256k1 } = require("thor-devkit");
const bent = require('bent');
const { address, abi } = require('./abi/samplecontract.js');
require('dotenv').config();

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
    },

    getEthersSigner : function () {
        var privateKey = process.env.OMG_THE_PRIVATE_KEY;
        const signer = new ethers.Wallet(privateKey);
        return signer;
    },
    vechainTest : async function() {
        // setup helper functions for http-requests
        const get = bent('GET', 'https://node-testnet.vechain.energy', 'json')
        const post = bent('POST', 'https://node-testnet.vechain.energy', 'json')
        const getSponsorship = bent('POST', 'https://sponsor-testnet.vechain.energy', 'json')

        // generate a random wallet for this interaction
        const wallet = ethers.Wallet.createRandom()
        //const wallet = this.getEthersSigner()

        // build the contract call
        const Counter = new ethers.Interface(abi)
        const clauses = [{
            to: address,
            value: '0x0',
            data: Counter.encodeFunctionData("increment", [])
        }]

        // fetch status information for the network
        const bestBlock = await get('/blocks/best')
        const genesisBlock = await get('/blocks/0')

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
        })

        // simulate the transaction
        const tests = await post('/accounts/*', {
            clauses: transaction.body.clauses,
            caller: wallet.address,
            gas: transaction.body.gas
        })

        // check for errors and throw if any
        for (const test of tests) {
            if (test.reverted) {

            const revertReason = test.data.length > 10 ? ethers.AbiCoder.defaultAbiCoder().decode(['string'], `0x${test.data.slice(10)}`) : test.vmError
            throw new Error(revertReason)
            }
        }

        // get fee delegation signature
        const { signature } = await getSponsorship('/by/90', { origin: wallet.address, raw: `0x${transaction.encode().toString('hex')}` })
        const sponsorSignature = Buffer.from(signature.substr(2), 'hex')

        // sign the transaction
        const signingHash = transaction.signingHash()
        const originSignature = secp256k1.sign(signingHash, Buffer.from(wallet.privateKey.slice(2), 'hex'))
        transaction.signature = Buffer.concat([originSignature, sponsorSignature])

        // submit the transaction
        const rawTransaction = `0x${transaction.encode().toString('hex')}`
        const { id } = await post('/transactions', { raw: rawTransaction })
        console.log('Submitted with txId', id)
    }
};

module.exports = vechain_utils;

