//Usando o serviço criado, no caso o meu se chama CatalogService
using CatalogService from './interactionsNW';

//Aqui são pegas as colunas da tabela Northwind_Customer do serviço CatalogService
//e são colocados títulos para as respectivas colunas.EX: O título dos dados da CustomerID é ID
annotate CatalogService.Northwind_Customers with {
    CustomerID @title: 'ID';
    CompanyName @title : 'Company Name';
    City @title : 'City';
    Country @title : 'Country';
    ContactTitle @title : 'Contact Title';
    ContactName @title : 'Contact Name';
    Address @title : 'Address';
    PostalCode @title : 'Postal Code';
    Phone @title : 'Phone Number';
    Fax @title : 'Fax Number';
};


annotate CatalogService.Northwind_Customers with @(
    UI: {
        //Aqui são feitos filtros para CompanyName e Country
        SelectionFields:[
            CompanyName,
            Country
        ],
        //Aqui é colocado como padrão as seguintes colunas,
        //para que ao clicar Iniciar já venha as informações delas
        LineItem: [
            { Value: CustomerID },
            { Value: CompanyName},
            { Value: City},
            { Value: Country}
        ],
        /*Muda o nome do Header do plural(na visualização da lista customers)
        para o singular(quando olhando os detalhes do customer). */
        HeaderInfo: {
            TypeName: 'Customer',
            TypeNamePlural: 'Customers',
            /*No Title, o campo vai receber o CustomerID.
            $Type procura qual é o typo de dados que serão aceitos.
            UI.DataField mostra que serão campos de texto que aceitam valores
            por Label e Value*/
            Title: {
                $Type: 'UI.DataField',
                Value: CustomerID,
            },
            //No Description, o campo vai receber o CompanyName
            Description:{
                $Type: 'UI.DataField',
                Value: CompanyName
            }
        },
        /*O Facet vai criar secções com titulo e informações 
        vindas dos FieldGroups criados para obter seus valores*/
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Contact',
                Target: '@UI.FieldGroup#Contact'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Address',
                Target: '@UI.FieldGroup#Address'
            }
        ],
        /*O nome do grupo vem depois da #, dentro dele você pode
        escolher quais dados estão associados a esse grupo*/
        FieldGroup #Contact : {
            Data: [
                {Value: ContactTitle},
                {Value: ContactName},
                {Value: Phone},
                {Value: Fax}
            ]
        },
        FieldGroup #Address : {
            Data: [
                {Value: Address},
                {Value: City},
                {Value: Country},
                {Value: PostalCode}
            ]
        },
    }
){

};