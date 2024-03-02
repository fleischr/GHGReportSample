using { ghgcds.sample as ghgdata } from '../db/schema';
service GHGService @(path:'/emissionsdata') {
    @readonly entity CarbonEmissions as select from ghgdata.CarbonEmissions{*};
    @readonly entity GHGOrganization as select from ghgdata.GHGOrganization{*};
    @requires: 'authenticated-user'
    action verifyEmissions(emissions: CarbonEmissions:ID, scope: Integer);

    @requires: 'authenticated-user'
    action offsetEmissions(emissions: CarbonEmissions:ID);
}