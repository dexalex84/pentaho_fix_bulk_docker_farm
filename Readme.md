# Docker-compose farm used to test PDI-16254
In this farm you create:
1) "DB_SOURCE" MSSQL latest version from docker hub
2) "DB_DEST" PostreSQL latest version from docker hub
3) "APP_PENTAHO_DI" Pentaho-Kettle dist used to RUN packages

# Installation
1) create folder and clone repo into
```git clone https://github.com/dexalex84/pentaho_fix_bulk_docker_farm.git``` 
2) create folder "distr"
3) put INTO folder "distr" pentaho-kettle files (root PDI folder with files "spoon.sh", etc):
 ```
 distr\
       Carte.bat
       carte.sh
       classes
       Data Integration.app
       Data Service JDBC Driver
       docs
       ...
       Spoon.bat
       spoon.command
       SpoonConsole.bat
       SpoonDebug.bat
       SpoonDebug.sh
       spoon.ico
       spoon.png
       spoon.sh
       system
       ui
       yarn.sh
```
4) run ```docker-compose up -d``` (docker must be installed)
5) wait 5-10 sec to MSSQL server is configured
6) run ```./prepare_environment.sh```
7) check source DB and dest DB by ```./select_source.sh``` and ```./select_dest.sh```
8) run ```./start_insert.sh``` - that will:
```
                                    a. insert ALL fields into target db_dest - if u use FIXED pentaho_kettle build
                                    b. fail with error - if u use 6.1 UNFIXED version from sourceforge
                                    c. insert 1 row but datetime and bytea fields will be EMPTY if u use 7.0 UNFIXED version from soureforge
```
9) check source DB and dest DB by ```./select_source.sh``` and ```./select_dest.sh``` one more time

## Links
   http://jira.pentaho.com/browse/PDI-16254
