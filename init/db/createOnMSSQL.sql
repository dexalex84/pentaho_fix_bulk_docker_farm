if object_id ('dbo.test_date_byte_insert') is not null 
drop table dbo.test_date_byte_insert
;

create table dbo.test_date_byte_insert
(
	id int,
	datetime_field datetime,
	binary_field binary(16) 
);

insert into dbo.test_date_byte_insert
(
	id ,
	datetime_field ,
	binary_field
)
select 1, getdate(), cast(newid() as binary(16));


