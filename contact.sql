drop table if exists contact;
create table contact(
    contact_ID int not null auto_increment,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    PostalCode varchar(5) not null,
    FullName varchar(25) not null, Company varchar(30),City varchar(30), State varchar(2),
    Email varchar(40), Phone varchar(20),Fax varchar(20),
    Title varchar(4),
    Street varchar(40),
    primary key (contact_ID)
)AS select distinct FirstName, LastName, Company, City, Title, State,Fax,
    PostalCode , FullName, Street,Email,Phone from invoices
where FirstName is not null and LastName is not null and Street is not null and City is not null
  and PostalCode is not null and Company is not null and Email is not null
  and State is not null and FullName is not null and Phone is not null and Fax is not null
order by  Company;

alter table contact add column city_ID int(10);
ALTER TABLE contact
ADD FOREIGN KEY (city_ID) REFERENCES city(city_ID);
update contact
inner join city
on City.City=contact.City
set contact.city_ID=city.city_ID where city.city_ID is not null;

alter table contact add column state_ID int(10);
ALTER TABLE contact
ADD FOREIGN KEY (state_ID) REFERENCES state(state_ID);
update contact
inner join state
on state.state=contact.State
set contact.state_ID=state.state_ID where state.state_ID is not null;

alter table contact add column customer_ID int(10);
ALTER TABLE contact
ADD FOREIGN KEY (customer_ID) REFERENCES company(customer_ID);
update contact
inner join company
on company.Company=contact.Company
set contact.customer_ID=company.Customer_ID where company.Customer_ID is not null;



alter table contact add column title_ID int(10);
ALTER TABLE contact
ADD FOREIGN KEY (title_ID) REFERENCES title(title_ID);
update contact
inner join title
on title.title=contact.Title
set contact.title_ID=title.title_ID where title.title_ID is not null;


ALTER TABLE email
ADD
 FOREIGN KEY (contact_ID) REFERENCES contact(contact_ID);

update email
inner join contact
on email.Email=contact.Email
set email.contact_ID=contact.contact_ID where contact.contact_ID is not null;


update phone
inner join contact
on contact.Phone = phone.number
set phone.Contact_ID = contact.Contact_ID
where contact.Contact_ID is not null;

update phone
inner join contact
on contact.Fax = phone.number
set phone.Contact_ID = contact.Contact_ID
where contact.Contact_ID is not null;

alter table phone
add foreign key (contact_ID) references contact(contact_ID);

