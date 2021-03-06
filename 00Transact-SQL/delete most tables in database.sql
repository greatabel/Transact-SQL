
---检查表状态
--EXEC   sp_MSforeachtable   @command1="print '?'   DBCC   CHECKTABLE('?')"
---print each table of the database
--exec sp_MSforeachtable 'print "?" '

--打印所有的数据库
--exec sp_MSforeachdb  'print "?" '
use testDB 
declare @tablename nvarchar(1000)


select [name] into #tablename from sysobjects where type='U' and name not in
( 
'greatabel621','621Agent_New','621Office_New','MST_Metro_Area','MST_CITY_Subarea','MST_CITY','Map_main',
'Map_switch'
);

select * from #tablename 

--when #tablename has data
while( select COUNT(1) from #tablename )>0
  begin
  --取第一条
  select top 1 @tablename =[name] from #tablename ;
  exec('drop table ['+@tablename+']');
  delete from #tablename where [name]=@tablename ;
  end

drop table #tablename 

