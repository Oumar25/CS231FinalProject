create table products(
    products_ID int not null auto_increment,
    PartNumber int(20) not null,
    ProductName varchar(50),
    Taxable varchar(1),
    price varchar(5),
    ProductWeight int(10),
    UnitDimensions varchar (10),
    primary key (products_ID)
) AS
    select distinct PartNumber,ProductName,Price,Taxable,ProductWeight,UnitDimensions
 from invoices where PartNumber is not null  And ProductName is not null and Price is not null
    and Taxable is not null and ProductWeight is not null and UnitDimensions is not null
    order by PartNumber;