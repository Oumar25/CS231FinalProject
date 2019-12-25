drop table if exists fake;
create table fake(
    customer_ID int not null auto_increment,
    Company varchar(20) not null ,
    DiscountRate int(10) not null,
    primary key (customer_ID)
)
AS
    select distinct DiscountRate, Company from invoices
where DiscountRate is not null and Company is not null order by DiscountRate;
CREATE TABLE company
AS(
SELECT t.Company
     , t.DiscountRate
  FROM ( SELECT Company
              , MAX(DiscountRate) AS max_discount
           FROM fake
         GROUP
             BY Company ) AS m
INNER
  JOIN fake AS t
    ON t.Company = m.Company
   AND t.DiscountRate = m.max_discount);
alter table company
add column Customer_ID int not null primary key auto_increment;
drop table fake;