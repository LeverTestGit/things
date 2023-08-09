sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'things/test/integration/FirstJourney',
		'things/test/integration/pages/ThingsList',
		'things/test/integration/pages/ThingsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ThingsList, ThingsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('things') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheThingsList: ThingsList,
					onTheThingsObjectPage: ThingsObjectPage
                }
            },
            opaJourney.run
        );
    }
);