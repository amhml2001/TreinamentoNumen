//Expõem as tabelas como OData, os serviços aparecem como serviços ABAP 
using app.interactions from '../db/interactions';
service CatalogService {

    entity Interactions_Header
        as projection on interactions.Interactions_Header;

    entity Interactions_Items
        as projection on interactions.Interactions_Items;

}
