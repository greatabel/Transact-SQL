use Northwind
SELECT datepart(yyyy,[OrderDate]) as 'myYear',
count( case datepart(qq,orderDate) when 1 then 1 else null end ) as Q1,
count( case datepart(qq,orderDate) when 2 then 1 else null end ) as Q2,
count( case datepart(qq,orderDate) when 3 then 1 else null end ) as Q3,
count( case datepart(qq,orderDate) when 4 then 1 else null end ) as Q4,
count(*) as Total
	

  FROM [Northwind].[dbo].[Orders]
group by datepart(yyyy,OrderDate)
order by 1