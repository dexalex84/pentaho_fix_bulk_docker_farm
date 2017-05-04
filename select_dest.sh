docker-compose exec db_dest su postgres -c "psql -d mydb -c 'select * from public.test_date_byte_insert;'"

