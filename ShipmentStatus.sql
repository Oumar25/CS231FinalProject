drop table if exists shipmentStatus;
create table shipmentStatus(
    shipmentStatus_ID int not null auto_increment,
    ShipmentStatus varchar(10),
    primary key (shipmentStatus_ID)
)AS
    select distinct ShipmentStatus from invoices
where ShipmentStatus is not null
order by ShipmentStatus;