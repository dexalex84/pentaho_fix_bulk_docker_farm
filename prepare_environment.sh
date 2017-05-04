	
 echo copy creating scripts to server START...
 docker cp ./init/db/createOnMSSQL.sql db_source:/tmp
 docker cp ./init/db/createOnPostgreSQL.sql db_dest:/tmp
 echo END

 echo put debug script to db_source START
 docker cp ./init/db/select_source.sh db_source:/tmp 
 echo END

 echo run these files on RMDS db_source server START...
 docker cp ./init/db/createMS.sh db_source:/tmp
 docker-compose exec  db_source /bin/bash /tmp/createMS.sh
 echo END

 echo run these files on RMDS db_dest server START...
 docker cp ./init/db/createPG.sh db_dest:/tmp
 docker-compose exec db_dest /bin/bash /tmp/createPG.sh
 echo END

 echo INSTRUCTION
 echo =================================================
 echo 1. check source DB and dest DB by "select_source.sh" and "select_dest.sh"
 echo 2. run "start_insert.sh" - that will:
 echo                                     a. insert ALL fields into target db_dest - if u use FIXED pentaho_kettle build
 echo                                     b. fail with error - if u use 6.1 UNFIXED version from sourceforge
 echo                                     c. insert 1 row but datetime and bytea fields will be EMPTY if u use 7.0 UNFIXED version from soureforge
 echo 3. check source DB and dest DB by "select_source.sh" and "select_dest.sh" one more time
 echo 
 echo Have a nice day! 
