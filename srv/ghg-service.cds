using { ghgcds.sample as ghgdata } from '../db/schema';
service GHGService @(path:'/emissionsdata') {
    entity CarbonEmissions as select from ghgdata.CarbonEmissions{*};
    entity GHGOrganization as select from ghgdata.GHGOrganization{*};
    entity GHGVerifier as select from ghgdata.GHGVerifier{*};
    entity GHGContact as select from ghgdata.GHGContact{*};
    @requires: 'authenticated-user'
    action verifyEmissions(emissions: CarbonEmissions:ID, scope: Integer);

    @requires: 'authenticated-user'
    action offsetEmissions(emissions: CarbonEmissions:ID);
}