drop table if exists public.test_date_byte_insert
;

create table public.test_date_byte_insert
(
	id int,
	datetime_field timestamp,
	binary_field bytea
);
