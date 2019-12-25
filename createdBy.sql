drop table if exists createdBY;
create table createdBy(
    CreatedBy_ID int not null auto_increment,
    CreatedBy varchar(5) not null ,
    primary key (CreatedBy_ID)
)as select distinct CreatedBy from invoices
where CreatedBy is not null order by CreatedBy;