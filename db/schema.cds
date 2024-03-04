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

entity CarbonOffset : managed {
    key InternalOffsetID : Integer;
    isRetired : Boolean;
    isForward : Boolean;
    NetworkID : String;
    OffsetAmount : Decimal(18, 9);
    UnitOfMeasure : String;
}

entity AtomicCarbonRetirement : managed {
    key ACRID : Integer;
    NetworkID : String;
    OffsetAmount : Decimal(18, 9);
    UnitOfMeasure : String;
}

entity GHGOrganization : managed {
    key GHGOrganizationID : String;
    CompanyCode : String;
    Name : String;
    Description : String;
    emissions : Association to CarbonEmissions on emissions.GHGOrgID = GHGOrganizationID;
}

entity GHGVerifier : managed {
    key VerifierID : String;
    Description : String;
    ContactID : String;
    Contact : Association to GHGContact on Contact.ContactID = ContactID;
}

entity GHGContact : managed {
    key ContactID : String;
    DID : String;
    Name : String;
    Email : String;
    PhoneNumber : String;
}