set nocount on
declare c cursor scroll
for select distinct mls_db FROM [iGendev_web_mst].[dbo].[iGen_House_Info]
declare @k int 

open c
fetch c into @k  --get 1st row

while(@@FETCH_STATUS =0) begin
 select top 10 mls_num ,mls_db FROM [iGendev_web_mst].[dbo].[iGen_House_Info] where mls_db=@k
fetch c into @k
end 

close c
deallocate c

