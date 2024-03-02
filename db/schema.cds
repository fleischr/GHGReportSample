using { Currency, managed, sap } from '@sap/cds/common';
namespace ghgcds.sample;

entity CarbonEmissions : managed {
    key ID : Integer;
    ObjectType : String;
    ObjectKey : String;
    CO2eAmount : Decimal(18, 9);
    UnitOfMeasure : String;
    EmissionsFrom : DateTime;
    EmissionsTo : DateTime;
    GHGOrgID :  String;
}

/*entity CarbonOffset : managed {
    key ID : Integer;
}

entity AtomicCarbonOffset : managed {
    key ID : Integer;
}*/

entity GHGOrganization : managed {
    key GHGOrganizationID : String;
    CompanyCode : String;
    Name : String;
    Description : String;
    emissions : Association to CarbonEmissions on emissions.GHGOrgID = GHGOrganizationID;
}

/*
entity GHGSummary {

}

entity GHGVerifier : managed {
    key VerifierID : String;
    Description : String;
    ContactID : String;
}

GHGContact : managed {
    key ContactID : String;
    DID : String;
    Name : String;
    Email : String;
    PhoneNumber : String;
}*/