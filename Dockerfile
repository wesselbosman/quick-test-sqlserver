FROM microsoft/mssql-server-linux:2017-CU12
EXPOSE 1433
COPY ["test.mdf", "./db/"]
COPY ["test_log.ldf", "./db/"]
ENV SA_PASSWORD=SuperSecretStrongPassword01!
ENV ACCEPT_EULA=Y
#/opt/mssql-tools/bin/sqlcmd -U sa -P "SuperSecretStrongPassword01!" -Q "USE [master] CREATE DATABASE [test] ON ( FILENAME = N'/db/test.mdf' ),( FILENAME = N'/db/test_log.ldf' ) FOR ATTACH"
#docker build . -t testsql
#docker run -d -p 15788:1433 --memory 3gb --name testdbcontainer testsql:latest
#docker exec -it testdbcontainer bash -c /opt/mssql-tools/bin/sqlcmd -U sa -P "SuperSecretStrongPassword01!" -Q "USE [master] CREATE DATABASE [test] ON ( FILENAME = N'/db/test.mdf' ),( FILENAME = N'/db/test_log.ldf' ) FOR ATTACH"
#docker exec -it testdbcontainer /opt/mssql-tools/bin/sqlcmd -U sa -P "SuperSecretStrongPassword01!" -Q "USE [master] CREATE DATABASE [test] ON ( FILENAME = N'/db/test.mdf' ),( FILENAME = N'/db/test_log.ldf' ) FOR ATTACH"

