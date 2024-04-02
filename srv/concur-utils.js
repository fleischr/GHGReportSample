const cds = require("@sap/cds");

var concur_utils = {
    getItineraryMock : async function(){
        var concurItinerayMock = {};
        var concurapi = cds.connect.to('Itinerary.API');
        return concurItinerayMock;
    }
};

module.exports = concur_utils;