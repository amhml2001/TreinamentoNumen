namespace app.interactionsNW;

entity Northwind_Categories {
    key CategoryID : Integer;
    ITEMS : Composition of many Northwind_Products on ITEMS.CategoryID = $self;
    CategoryName: String(30);
    Description: String(100);
};


entity Northwind_Products {
    key ProductID : Integer;
    ProductName : String(50);
    SupplierId: String(10);
    key CategoryID : association to Northwind_Categories;
    QuantityPerUnit : String(50);
    UnitPrice: String(10);
    UnitsInStock: Integer;
    UnitOnOrder: Integer;
    ReorderLevel: Integer;
    Discontinued: Boolean;
};

entity Northwind_Customers {
    key CustomerID : String(5);
    CompanyName : String(50);
    ContactName : String(50);
    ContactTitle: String(30);
    Address: String(50);
    City: String(30);
    PostalCode: String(10);
    Country: String(20);
    Phone: String(20);
    Fax: String(20);
    Region: String(20);
};