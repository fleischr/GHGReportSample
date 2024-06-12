const cds = require('@sap/cds')
const cors = require('cors')
const proxy = require('@sap/cds-odata-v2-adapter-proxy')

cds.on('bootstrap', srv => {
    console.log('bootstrapping...')
    srv.use(proxy())
    srv.use(cors()) 
    srv.get('/health', (_, res) => {
        res.status(200).send('OK')
    })
})

if(process.env.NODE_ENV != 'production') {
    require('dotenv').config()
    const cds_swagger = require('cds-swagger-ui-express')
    cds.on('bootstrap', srv => srv.use(cds_swagger()))
}

module.exports = cds.server