sap.ui.define([
    "numen/talentos/app001amh/controller/BaseController",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "../model/formatter"
],
	/**
	 * @param {typeof sap.ui.core.mvc.Controller} Controller
	 */
	function (BaseController, Filter, FilterOperator, formatter) {
		"use strict";

		return BaseController.extend("numen.talentos.app001amh.controller.View1", {
            formatter: formatter,
			onInit: function () {

                //Binds
                var oInput = this.byId("companyInput");
                oInput.bindProperty("value", "companyModel>/ScarrSet/Carrname");

                //var vLayout = this.byId("vLayout");
                //vLayout.bindElement("companyModel>/ScarrSet");

                //Lista por meio de um controler
                /*var oListControl = this.byId("companyList");
                var oUiControl = new sap.m.ObjectListItem({
                    title: "{Carrname}",
                    type: "Active"
                });

                oUiControl.addAttribute(new sap.m.ObjectAttribute({
                    text: "{Url}"
                }));

                oUiControl.addAttribute(new sap.m.ObjectAttribute({
                    text: "{Currcode}"
                }));

                oListControl.bindAggregation("items", "/ScarrSet", oUiControl);*/




            },
            
            onFilterCompanies: function(oEvent){
                
                var aFilter = [];
                var sQuery = oEvent.getParameter("query");
                if(sQuery){
                    aFilter.push(new Filter("Carrid", FilterOperator.EQ, sQuery));
                }

                var oList = this.getView().byId('companyList');
                var oBinding = oList.getBinding("items");
                oBinding.filter(aFilter);
            },

            onListItemPressed: function (oEvent){
                var oItem, oCtx;
                oItem = oEvent.getSource();
                oCtx = oItem.getBindingContext();
                    this.getRouter().navTo("RouteCompanyDetail", {
                        Carrid: oCtx.getProperty("Carrid")
                    });
            },

            onBtnCreatePress: function(oEvent){
                this.getRouter().navTo("RouteCompanyDetail",{
                    Carrid: "New"
                });
            }
		});
	});
