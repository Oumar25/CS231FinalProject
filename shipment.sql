create table shipment(
    shipment_ID int not null auto_increment,
     ShipVia varchar(20) not null,
    primary key (shipment_ID)
)AS
	SELECT DISTINCT ShipVia
	FROM invoices
	WHERE ShipVia IS NOT NULL
	ORDER BY ShipVia;
