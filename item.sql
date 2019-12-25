drop table  if exists item;
create table item(
    item_ID int not null auto_increment,
    quantity int(2),
    PartNumber int(20) not null,
    Price float not null,
    primary key (item_ID)
) AS select distinct Quantity,PartNumber,Price
from invoices where Quantity is not null and Partnumber is not null and Price is not null order by Quantity;

alter table item add column products_ID int(10);
ALTER TABLE item
ADD FOREIGN KEY (products_ID) REFERENCES products(products_ID);
update item
inner join products
on item.PartNumber=products.PartNumber
set item.products_ID=products.products_ID where products.products_ID is not null;
