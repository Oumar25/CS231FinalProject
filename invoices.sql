alter table invoices add column customer_ID int(10);
alter table invoices add column contact_ID int(10);
alter table invoices add column item_ID int(10);
alter table invoices add column shipment_ID int(10);
alter table invoices add column CreatedBy_ID int(10);
alter table invoices add column ShipmentStatus_ID int(10);


ALTER TABLE invoices
ADD
 FOREIGN KEY (contact_ID) REFERENCES contact(contact_ID);
ALTER TABLE invoices
ADD
 FOREIGN KEY (customer_ID) REFERENCES company(customer_ID);
ALTER TABLE invoices
ADD
 FOREIGN KEY (item_ID) REFERENCES item(item_ID);

 ALTER TABLE invoices
ADD
 FOREIGN KEY (shipment_ID) REFERENCES shipment(shipment_ID);
ALTER TABLE invoices
ADD
 FOREIGN KEY (CreatedBy_ID) REFERENCES createdby(CreatedBy_ID);

ALTER TABLE invoices
ADD
 FOREIGN KEY (ShipmentStatus_ID) REFERENCES shipmentstatus(shipmentStatus_ID);


update invoices
inner join contact c on invoices.Company = c.Company
set invoices.contact_ID=c.contact_ID where c.contact_ID is not null;

update invoices
inner join company c on invoices.Company = c.Company
set invoices.customer_ID=c.Customer_ID where c.Customer_ID is not null;

update invoices
inner join item c on invoices.PartNumber = c.Partnumber
set invoices.item_ID=c.item_ID where c.item_ID is not null;

update invoices
inner join shipment s on invoices.ShipVia = s.ShipVia
set invoices.shipment_ID=s.shipment_ID where s.shipment_ID is not null;

update invoices
inner join createdby c on invoices.CreatedBy = c.CreatedBy
set invoices.CreatedBy_ID=c.CreatedBy_ID where c.CreatedBy_ID is not null;

update invoices
inner join shipmentstatus s on invoices.ShipmentStatus = s.ShipmentStatus
set invoices.ShipmentStatus_ID=s.shipmentStatus_ID where s.shipmentStatus_ID is not null;

alter table invoices add column Street_ShipTo varchar(30);
alter table invoices add column State_ShipTo varchar(30);
alter table invoices add column ZipCode_ShipTo varchar(30);
alter table invoices add column City_ShipTo varchar(30);

alter table invoices add column Street_BillTo varchar(30);
alter table invoices add column State_BillTo varchar(30);
alter table invoices add column ZipCode_BillTo varchar(30);
alter table invoices add column City_BillTo varchar(30);

alter table invoices add primary key (InvoiceID);

update invoices set invoices.Street_BillTo=Street where InvoiceID=InvoiceID;
update invoices set invoices.Street_ShipTo=Street where InvoiceID=InvoiceID;

update invoices set invoices.State_ShipTo=State where InvoiceID=InvoiceID;
update invoices set invoices.State_BillTo=State where InvoiceID=InvoiceID;

update invoices set invoices.ZipCode_BillTo=PostalCode where InvoiceID=InvoiceID;
update invoices set invoices.ZipCode_ShipTo=PostalCode where InvoiceID=InvoiceID;

update invoices set invoices.City_ShipTo=City where InvoiceID=InvoiceID;
update invoices set invoices.City_BillTo=City where InvoiceID=InvoiceID;

