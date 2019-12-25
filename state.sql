drop table if exists state1;
create table state1(
    TaxRate int(3) not null ,
    state varchar(2) not null
)AS
	SELECT DISTINCT state,TaxRate
	FROM invoices
	WHERE state IS NOT NULL and TaxRate is not null
	ORDER BY state;
CREATE TABLE state
AS(
SELECT t.state
     , t.TaxRate
  FROM ( SELECT state
              , MAX(TaxRate) AS max_rate
           FROM state1
         GROUP
             BY state ) AS m
INNER
  JOIN state1 AS t
    ON t.state = m.state
   AND t.TaxRate = m.max_rate);
Alter table state add column state_ID int auto_increment not null primary key;
drop table state1;