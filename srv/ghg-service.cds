using { ghgcds.sample as ghgdata } from '../db/schema';
service GHGService @(path:'/emissionsdata') {
    entity CarbonEmissions as select from ghgdata.CarbonEmissions actions{
        action offsetEmissions(emissionsID: CarbonEmissions:ID) returns ghgdata.CarbonOffsetType;
        action tokenizeEmissions(emissionsID: CarbonEmissions:ID) returns Integer;
        action requestScope3Verification(emissionsID: CarbonEmissions:ID) returns ghgdata.scope3Verification;
        action vechaintest() returns Integer;
    };
    entity GHGOrganization as select from ghgdata.GHGOrganization{*};
    entity GHGVerifier as select from ghgdata.GHGVerifier{*};
    entity GHGContact as select from ghgdata.GHGContact{*};

    function offsetEmissions(emissionsID: CarbonEmissions:ID) returns ghgdata.CarbonOffsetType;
    function tokenizeEmissions(emissionsID: CarbonEmissions:ID) returns Integer;
    function requestScope3Verification(emissionsID: CarbonEmissions:ID) returns ghgdata.scope3Verification;
    function vechaintest() returns Integer;

}