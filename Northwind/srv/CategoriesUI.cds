using CatalogService from './interactionsNW';

annotate CatalogService.Northwind_Categories with {
    CategoryName @title : 'Category Name';
    Description @title : 'Description';
    CategoryID @title : 'ID';
};

annotate CatalogService.Northwind_Categories with @(
    UI:{
        SelectionFields  : [
            CategoryName
        ],
        LineItem  : [
            {Value: CategoryID},
            {Value: CategoryName}
        ],
        HeaderInfo : {
            TypeName : 'Category',
            TypeNamePlural : 'Categories',
            Title:{
                $Type : 'UI.DataField',
                Value: CategoryName
            },
            Description:{
                $Type : 'UI.DataField',
                Value: CategoryID
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
                {Value: Description}
            ]
        },
    }
){

};

 