 if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#results') and type='U') drop table #results
 create table #results(mls int,item varchar(50),rate int )
 ----
 declare @colname varchar(50)
 set @colname='year_built'
 
     declare @arrayvar varchar(8000)
    declare @i int ,@l int
    declare c cursor for select distinct cast(mls_db as char(15))  FROM [dbo].[iGen_House_Info]
    
   
    ----
    open c
    fetch c into @arrayvar
    
    while (@@FETCH_STATUS =0) begin
    set @i=0
    set @l=DATALENGTH (@arrayvar)/15
      while(@i<@l) begin
      
       if ( (select count(*) from iGen_house_info where mls_db=SUBSTRING (@arrayvar,(@i*15)+1,15))<100000)   
        
insert #results   
select SUBSTRING (@arrayvar,(@i*15)+1,15) as 'mls',* from
(select top 10  year_built,count(*)*100/(select count(*) from iGen_house_info where mls_db=SUBSTRING (@arrayvar,(@i*15)+1,15)) as rate
   from iGen_house_info where mls_db=SUBSTRING (@arrayvar,(@i*15)+1,15) 
   group by year_built 
   order by count(*)desc ) as abel
   
   
   
 
      
      
      set  @i=@i+1
        end
     fetch c into @arrayvar
     End
    close c
    Deallocate c
    
    select * from #results
    


