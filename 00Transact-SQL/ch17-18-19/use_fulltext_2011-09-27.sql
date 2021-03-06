/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info]
  
SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info] where contains(pr_info ,'New')
  ---method 2
SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info] where contains(* ,'New')
  
  SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info] where contains(* ,'New ~ City')

  ---m3
  
    SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info] where freetext(* ,'New ~ City')
  
 
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [pub_id]
      ,[logo]
      ,[pr_info]
  FROM [pubs].[dbo].[pub_info]
  
  ---use containstable
    SELECT *
 from containstable(pub_info ,*,'text')
 order by RANK desc;
  
   SELECT *
 from containstable(pub_info ,*,'isabout(text weight(0.8), sample weight(0.1))')
 order by RANK desc;
 
 --freetexttable
     SELECT * 
 from pub_info as E join freetexttable(pub_info ,*,'text') as R on (e.pub_id =R.[KEY])
 order by R.RANK desc;