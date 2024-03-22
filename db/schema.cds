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
    PriorID: String;
}

entity CarbonOffset : managed {
    key InternalOffsetID : Integer;
    isRetired : Boolean;
    isForward : Boolean;
    NetworkID : String;
    OffsetAmount : Decimal(18, 9);
    UnitOfMeasure : String;
    TransactionHash : String;
    Vintage : Integer;
    Region : String;
    Methodology : String;
}

type CarbonOffsetType  {
    InternalOffsetID : Integer;
    isRetired : Boolean;
    isForward : Boolean;
    NetworkID : String;
    OffsetAmount : Decimal(18, 9);
    UnitOfMeasure : String;
    TransactionHash : String;
    Vintage : Integer;
    Region : String;
    Methodology : String;
}


//need to relate retirement to emissions data correctly
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
    VerifyingOrgID : String;
    VerifyingOrg: Association to GHGOrganization on VerifyingOrg.GHGOrganizationID = VerifyingOrgID;
}

entity GHGContact : managed {
    key ContactID : String;
    DID : String;
    Name : String;
    Email : String;
    PhoneNumber : String;
}

entity Networks : managed {
    key NetworkID : String;
}

type emissionsToken {
    TokenID : String;
    SmartContractAddress: String;
    TransactionHash: String;
    NetworkID: String;
}

type scope3Verification {
    InternalID : Integer;
    ExternalID : Integer;
    Scope3TokenID : Integer;
    Scope1TokenID : Integer;
    Scope3GHGOrgID : String;
    Scope1GHGOrgID : String;
    Scope3ContractAddress : String;
    Scope1ContractAddress : String;
    VerificationStatus : Integer;
}