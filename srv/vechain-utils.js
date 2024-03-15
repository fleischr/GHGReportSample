import { Transaction } from "thor-devkit";

async function mintEmissionsNFT(){

};

async function addEmissionsData(){

};

function buildTransaction(clauses) {
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