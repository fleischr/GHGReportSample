const cds = require("@sap/cds");

module.exports = class ghgemissions extends cds.ApplicationService { init() {
    this.on('offsetEmissions', async(emissionsID) => {
        console.log('offsetting emissions for' + emissionsID);
    });

    return super.init();
} }