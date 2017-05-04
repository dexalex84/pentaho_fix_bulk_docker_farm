echo create db START...
/opt/mssql-tools/bin/sqlcmd  -U sa -P $SA_PASSWORD -Q "create database mydb"
echo END

echo create table START...
/opt/mssql-tools/bin/sqlcmd  -U sa -P $SA_PASSWORD -d mydb -i /tmp/createOnMSSQL.sql
echo END
