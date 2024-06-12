# GHG Reporting Template - SAP BTP CAP app

This app demonstrates a very basic carbon accounting data model for GHG (Greenhouse Gas) Inventory Reporting using CAP CDS (Cloud Application Programmaing Model - Core Data Services) on SAP BTP.

It's meant to simulate what I think is a to-be state of the SAP GreenLedger - as well as some experiments I'm running personally with carbon data tokenization and marketplace integration.

File or Folder | Purpose
---------|----------
`app/` | UI content goes here
`db/` | Domain models and data go here
`srv/` | Service models and code go here
`package.json` | project metadata and configuration


## Next Steps

- Open a new terminal and run `cds watch` (hint: I recommend full windows terminal/powershell or other elevated cli)
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

This app features an integration to the Carbon Emissions Tokenization prototype I've been building as part of developer grant from VeChain.

Learn more at https://github.com/fleischr/VechainCarbonEmissionsNFT


## Recommended add-ons

Need to get your SAP BTP dev environment set up locally? Try the <a href="https://github.com/fleischr/sapbtp_dev_readiness">Batman test</a>