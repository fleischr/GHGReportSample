const cds = require("@sap/cds");

module.exports = cds.service.impl(async function() {
    this.on('offsetEmissions', async(emissionsID) => {
        console.log('offsetting emissions for' + emissionsID);
    });

    this.on('tokenizeEmissions', async(req) =>{
        const { emissionsID } = req.data;
        return emissionsID;
    });
});
