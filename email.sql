drop table if exists email;
create table email(
    email_ID int not null auto_increment,
    EmailType varchar(10),
    Email varchar(40) not null,
    primary key (email_ID)
)as select distinct Email from invoices
where Email is not null order by Email;

update email
set EmailType='Work'
where email is not null;

alter table email add column contact_ID int(10);

