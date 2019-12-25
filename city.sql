drop table if exists city;
create table city(
    city_ID int not null auto_increment,
    City varchar(20) not null,
    primary key (city_ID)
)AS
	SELECT DISTINCT City
	FROM invoices
	WHERE City IS NOT NULL
	ORDER BY City;
	