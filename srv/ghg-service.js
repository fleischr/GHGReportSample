const cds = require("@sap/cds");
const vechain_utils = require("./vechain-utils");
module.exports = cds.service.impl(async function() {
    
    this.on('offsetEmissions', async(req) => {
        console.log("offsetting emissions");
        const { emissionsID } = req.data;
        console.log('offsetting emissions for' + emissionsID);
    });

    this.on('tokenizeEmissions', async(req) =>{
        console.log("tokenizing emissions");
        const { emissionsID } = req.data;
        //await vechain_utils.mintEmissionsNFT();
        return emissionsID;
    });
    this.on('requestScope3Verification', async(req) =>{
        console.log("begin scope 3 verification...");
        //return structure
    });
    this.on('vechaintest', async() => {
        await vechain_utils.vechainTest();
        console.log("completed vechain test");
    });
});
