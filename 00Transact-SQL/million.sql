set nocount on
use testDB
if(object_ID('financial_median') is not null)
drop table financial_median
go


declare @starttime datetime

set @starttime=getdate()

create table financial_median
(
c1 float default (
 (case (cast(rand()+.5 as int)*-1) when 0 then 1 else -1 end)*
                     (cast(rand()*100000 as int)% 10000)*rand() )
,c2 int default 0
)

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

insert financial_median default values

-- create a distribution of a million values
while( select top 1 rows from sysindexes where id=object_id('financial_median')
order by indid )< 1000000 begin
 insert financial_median (c2) select top 344640 c2 from financial_median 
end

select 'It took '+cast(datediff(ss,@starttime,getdate()) as varchar) +' seconds to create
and populate the table'

set @starttime=getdate()
--sort
create clustered index c1 on financial_median (c1)
alter table financial_median add k1 int identity
drop index financial_median.c1
create clustered index k1 on financial_median (k1)

select 'It took '+cast(datediff(ss,@starttime,getdate()) as varchar)+' seconds to sort the table'
go

--compute the financial median
declare @starttime datetime , @rows int
set @starttime =getdate()
set statistics time on
select top 1 @rows= rows from sysindexes where id=object_id('financial_median')
order by indid

select 'There are '+cast(@rows as varchar)+' rows'

select avg(c1) as "the financial median is" from financial_median 
where k1 between @rows/2 and(@rows/2)+sign(@rows+1%2)
set statistics time off

select 'It took '+cast(datediff(ms,@starttime,getdate()) as varchar)+' ms to compute the fiancial median'






