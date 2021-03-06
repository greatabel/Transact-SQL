/****** Script for SelectTopNRows command from SSMS  ******/
use pubs 
select 'before begin tran',@@TRANCOUNT 
begin tran
 select 'after begin tran',@@TRANCOUNT 
 delete sales
		  begin tran nested
		  select 'after begin nested',@@TRANCOUNT 
		  delete titleauthor
		  commit tran nested -- does nothing except decrement 
  select 'after commit tran nested',@@TRANCOUNT 
  go -- when posiible
  rollback tran
  select 'after rollback tran',@@TRANCOUNT 
  select top 5 au_id from titleauthor