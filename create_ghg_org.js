const { ethers } = require('ethers');
require('dotenv').config();
const cds = require('@sap/cds');
const fs = require('fs');

console.log("Creating GHG Org...");

async function main() {
    //using private key directly configured in dotenv FOR DEMONSTRATION PURPOSES ONLY
    // in PRODUCTION please for the love of GOD use a credential manager
    // Provide Vault is ideally suited for this
    const org_wallet = ethers.Wallet.createRandom();
    process.env.OMG_THE_PRIVATE_KEY = org_wallet.privateKey;
    setEnvValue("OMG_THE_PRIVATE_KEY", org_wallet.privateKey);
    process.env.ORG_PUBLIC_ADDRESS = org_wallet.publicKey;
    setEnvValue("ORG_PUBLIC_ADDRESS",org_wallet.publicKey);
    console.log("created org wallet id " + org_wallet.publicKey);
    reloadEnv();

}

function setEnvValue(key, newValue) {
    const file = fs.readFileSync(".env", "utf8");
    const newFile = file.replace(new RegExp(`^${key}=.+`, 'm'), `${key}=${newValue}`);
    fs.writeFileSync(".env", newFile);
}

async function reloadEnv() {
    const envConfig = dotenv.parse(fs.readFileSync('.env'));

    for (const key in envConfig) {
        process.env[key] = envConfig[key];
    }
}

main()
  .then(() => process.exit(0))
  .catch(console.error)
