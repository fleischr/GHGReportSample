using { ghgcds.sample as ghgdata } from '../db/schema';
service AdminService @(requires:'authenticated-user') {
    entity CarbonEmissions as projection on ghgdata.CarbonEmissions;
    entity GHGOrganization as projection on ghgdata.GHGOrganization;
    entity GHGVerifier as projection on ghgdata.GHGVerifier;
    entity GHGContact as projection on ghgdata.GHGContact;
}