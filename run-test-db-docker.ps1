docker container rm testdbcontainer -f
docker build . -t testsql
docker run -d -p 15788:1433 --memory 3gb --name testdbcontainer testsql:latest
docker exec testdbcontainer /opt/mssql-tools/bin/sqlcmd -U sa -P "SuperSecretStrongPassword01!" -Q "USE [master] CREATE DATABASE [test] ON ( FILENAME = N'/db/test.mdf' ),( FILENAME = N'/db/test_log.ldf' ) FOR ATTACH"