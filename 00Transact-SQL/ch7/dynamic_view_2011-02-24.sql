insert [pubs].[dbo].[sales] values(8042,'P2121',getdate(),1,'Net 30','TC7777')

-- 112 representative of 112	ISO	yymmdd
create view daily_sales as
select * 
from sales
where ord_date between convert( char(8),getdate(),112) and convert(char(8),getdate(),112)+' 23:59:59.999'

select * from daily_sales


create view daily_salesW as
select * from sales
where ord_date between 
(case datepart(dw,convert(char(8),getdate(),112))
  when 1 then convert(char(8),getdate()+1,112)
  when 7 then convert(char(8),getdate()-1,112)
else convert(char(8),getdate(),112)
end)
and
(
case datepart(dw,convert(char(8),getdate(),112))
 when 1 then convert(char(8),getdate()+1,112)
when 7 then convert(char(8),getdate()-1,112)
else
 convert(char(8),getdate(),112)
end +' 23:59:59.999')

select * from daily_salesW
