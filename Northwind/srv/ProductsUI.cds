using CatalogService from './interactionsNW';

annotate CatalogService.Northwind_Products with {
    ProductID @title : 'ID';
    ProductName @title : 'Product Name';
    SupplierId @title : 'Supplier';
    CategoryID @title : 'Category';
    UnitPrice @title : 'Unit Price';
    UnitsInStock @title : 'Units in Stock';
    UnitOnOrder @title : 'Unit on Order';
    ReorderLevel @title : 'Reorder Level';
    Discontinued @title : 'Discontinued';
};

annotate CatalogService.Northwind_Products with @(
    UI: {
        SelectionFields  : [
            ProductName
        ],
        LineItem  : [
            {Value: ProductID},
            {Value: ProductName},
            {Value: UnitPrice},
            {Value: UnitsInStock}
        ],
        HeaderInfo  : {
            TypeName : 'Product',
            TypeNamePlural : 'Products',
            Title:{
                $Type: 'UI.DataField',
                Value: ProductName
            },
            Description:{
                $Type: 'UI.DataField',
                Value: ProductID
            }
        },
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Details',
                Target: '@UI.FieldGroup#Details'
            }
        ],
        FieldGroup #Details : {
            Data:[
                {Value: UnitPrice},
                {Value: UnitsInStock},
                {Value: UnitOnOrder},
                {Value: ReorderLevel},
                {Value: Discontinued},
            ]
        },
    }
){

};

