use pubs
SELECT [stor_id]
      ,[ord_num]
      ,[ord_date]
      ,[qty]
      ,[payterms]
      ,[title_id]
  FROM [pubs].[dbo].[sales]

select * from titles

select 
"Less than 10"=count(case when s.sales>=0 and s.sales<10 then 1 else null end),
"10-19"=count(case when s.sales>=10 and s.sales<20 then 1 else null end)
from  (select t.title_id,sales=isnull(sum(s.qty),0) from titles t left outer join sales s
on(t.title_id=s.title_id) group by t.title_id) s

select PayTerms=isnull(s.payterms,'NA'),
"Less than 10"=count(case when s.sales>=0 and s.sales<10 then 1 else null end),
"10-19"=count(case when s.sales>=10 and s.sales<20 then 1 else null end)
from  (select t.title_id,sales=isnull(sum(s.qty),0),s.payterms from titles t left outer join sales s
on(t.title_id=s.title_id) group by t.title_id,payterms) s
group by s.payterms