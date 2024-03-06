sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'emissionsdatalist/test/integration/FirstJourney',
		'emissionsdatalist/test/integration/pages/CarbonEmissionsList',
		'emissionsdatalist/test/integration/pages/CarbonEmissionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarbonEmissionsList, CarbonEmissionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('emissionsdatalist') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarbonEmissionsList: CarbonEmissionsList,
					onTheCarbonEmissionsObjectPage: CarbonEmissionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);