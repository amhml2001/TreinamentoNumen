using app.interactionsNW from '../db/interactionsNW';
service CatalogService {

    entity Northwind_Categories
        as projection on interactionsNW.Northwind_Categories;

    entity Northwind_Products
        as projection on interactionsNW.Northwind_Products;

    entity Northwind_Customers
        as projection on interactionsNW.Northwind_Customers;

}