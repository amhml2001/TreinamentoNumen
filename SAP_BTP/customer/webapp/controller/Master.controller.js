sap.ui.define([
	"sap/ui/core/mvc/Controller"
],
	/**
	 * @param {typeof sap.ui.core.mvc.Controller} Controller
	 */
	function (Controller) {
		"use strict";

		return Controller.extend("customer.controller.Master", {
			onInit: function () {
                this.oRouter = this.getOwnerComponent().getRouter();
            },
            onSearch: function(oEvent){
            var oFilter = new sap.ui.model.Filter("CompanyName", sap.ui.model.FilterOperator.Contains, oEvent.getParameter("query"));
            this.getView().byId("tableCustomers").getBinding("items").filter([
                oFilter
            ], "Application")
            },
            onListPressItem: function(oEvent){
                var sCustomer = oEvent.getSource().getBindingContext().getPath().substr(10,5)
                this.oRouter.navTo("detail", {customer: sCustomer}, true);
            }
		});
	});
