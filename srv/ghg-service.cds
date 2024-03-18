using { ghgcds.sample as ghgdata } from '../db/schema';
service GHGService @(path:'/emissionsdata') {
    entity CarbonEmissions as select from ghgdata.CarbonEmissions{*};
    entity GHGOrganization as select from ghgdata.GHGOrganization{*};
    entity GHGVerifier as select from ghgdata.GHGVerifier{*};
    entity GHGContact as select from ghgdata.GHGContact{*};
    @requires: 'authenticated-user'
    @sap.applicable.path: 'verifyEmissions/{emissionsID}'
    action verifyEmissions(emissions: CarbonEmissions:ID) returns Boolean;

    @requires: 'authenticated-user'
    @sap.applicable.path: 'offsetEmissions/{emissionsID}'
    action offsetEmissions(emissions: CarbonEmissions:ID);

    function tokenizeEmissions(emissionsID: Integer) returns Integer;

}