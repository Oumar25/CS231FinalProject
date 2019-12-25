update invoices
set Title=null
where Title='';
create table title(
    title_ID int not null auto_increment,
    title varchar(5) not null,
    primary key (title_ID)
) AS
    select distinct title
from invoices where title is not null
order by title;