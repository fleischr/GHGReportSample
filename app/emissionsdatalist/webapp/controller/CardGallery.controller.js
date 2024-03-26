sap.ui.define([
    "./BaseController",
    "sap/ui/integration/library",
	"sap/ui/integration/Host"
], function (BaseController, integrationLibrary, Host) {
    "use strict";

    return BaseController.extend("globalnext2.controller.CardGallery", {

        onInit : function () {
            var uicard1 = this.getOwnerComponent().getModel("uicards");
            var oHost = new Host({
				action: this.onAction.bind(this)
			});
            this.byId("emmissiondataline").setHost(oHost);

        },
        onAction : function(oEvent) {
            // Prevent the default behavior of the handled actions
            var bHandled = false; // Flag indicating if the action is handled
           
			if (bHandled) {
				oEvent.preventDefault();
			}
        }
    });

});