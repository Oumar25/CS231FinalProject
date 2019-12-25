alter table contact
    drop Company,drop Title,drop State,drop City,
    drop Phone, drop Email,drop FullName,drop Fax;
alter table invoices
    drop FirstName,drop LastName,drop FullName,
    drop Company,drop Title,drop Fax,drop State,drop City,drop Street,
    drop PostalCode,drop DiscountRate,drop PartNumber,drop TaxRate,
    drop ProductName,drop ProductWeight,drop Email, drop Quantity,
    drop Price,drop Taxable,drop ShipVia,drop CreatedBy;
alter table item drop column PartNumber;
alter table invoices
drop UnitDimensions,drop TaxAmount,drop Phone,drop ShipmentStatus;
alter table invoices add primary key (InvoiceID);
alter table invoices drop ExtendedPrice;