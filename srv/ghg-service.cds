using { ghgcds.sample as ghgdata } from '../db/schema';
service GHGService @(path:'/emissionsdata') {
    entity CarbonEmissions as select from ghgdata.CarbonEmissions{*};
    entity GHGOrganization as select from ghgdata.GHGOrganization{*};
    entity GHGVerifier as select from ghgdata.GHGVerifier{*};
    entity GHGContact as select from ghgdata.GHGContact{*};

    function offsetEmissions(emissions: CarbonEmissions:ID) returns ghgdata.CarbonOffsetType;
    function tokenizeEmissions(emissionsID: Integer) returns Integer;
    function requestScope3Verification(emissionsID: Integer) returns ghgdata.scope3Verification;

}