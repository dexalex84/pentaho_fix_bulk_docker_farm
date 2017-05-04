psql -U postgres -c "create database mydb;"
psql -U postgres -d mydb -f "/tmp/createOnPostgreSQL.sql" 
