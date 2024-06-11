const cds = require('@sap/cds')

cds.on('bootstrap', srv => {
    console.log('bootstrapping...')
})

if(process.env.NODE_ENV != 'production') {
    require('dotenv').config()
    const cds_swagger = require('cds-swagger-ui-express')
    cds.on('bootstrap', srv => srv.use(cds_swagger()))
}

module.exports = cds.server