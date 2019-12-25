drop table if exists phone;
create table phone(
    contact_ID int,
    phoneType varchar(10),
    number varchar(20)
);
insert into phone(number)
select Phone from invoices
order by Phone;
update phone
set phoneType='Phone' where phoneType is null;
insert into phone(number)
select Fax from invoices
order by Fax;
update phone
set phoneType='Fax' where phoneType is null;
