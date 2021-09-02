sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "numen/t21/apps/orders/util/formatter",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/Sorter"
], function(Controller, formatter, JSONModel, FilterOperator, Sorter) {
    "use strict";

    return Controller.extend("customer.controller.Detail", {
        formatter: formatter,
        oJson: { Data: undefined, Invoices: []},

        onInit: function(){
            this.oModel = this.getOwnerComponent().getModel();
            this.oModel.attachRequestCompleted(function(oResponse){
                if(oResponse.getParameter("method").toUpperCase() == "GET"){
                    var oResults = JSON.parse(oResponse.getParameter("response").responseText).d.results;

                    if(oResponse.getParameter('url').indexOf("Orders") > -1)
                        this.processData(oResults);
                    if(oResponse.getParameter('url').indexOf("Invoices") > -1)
                        this.processInvoices(oResults);
                }else
                    sap.m.MessageToast.show("Erro na comunicação");
            }, this);

            this.oRouter = this.getOwnerComponent().getRouter();
            this.oRouter.getRoute("master").attachPatternMatched(this.onOrderMatched, this);
            this.oRouter.getRoute("detail").attachPatternMatched(this.onOrderMatched, this);
        },
        /*É realizado para pegar o número da ordem que será armazenado em sOrder. Depois ele
        consegue pegar as informações do cliente(quem vai receber) e do próprio pacote*/
        onOrderMatched: function(oEvent){
            this.sOrder = oEvent.getParameter("arguments").order;
            this.getData();
            this.getInvoices();
        },
        /*É realizado para pegar as informações do cliente(quem vai receber). Obtem-se o ID pelo OrderID
        da tabela de dados(oData) e procura-se nela o ID equivalente ao sOrder. Na aplicação o filtro é
        usado para mostrar apenas as informações deste pedido(order) procurando também na url de clientes
        (Customer) e de Entregador(Shipper). No invoices o proesso é parecido só que iremos procurar apenas
        as informações do Invoice*/
        getData: function(){
            var oFilters = []
            oFilters.push(new sap.ui.model.Filter("CustomerID", sap.ui.model.FilterOperator.EQ, this.sOrder));
            this.oModel.read("/Customers", {
                filters: oFilters,
                urlParameters: { "$expand": "Customer" }
            });
        },
        processData: function(oJson){
            this.oJson.Data = oJson[0];
            var oModel = new JSONModel(this.oJson);
            this.getView().setModel(oModel);
        }
    });
    
});