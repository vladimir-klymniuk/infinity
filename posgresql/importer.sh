DB_NAME=$1
#DUMP_PATH=./${DB_NAME}/forge.sql
DB_HOST=
DB_PORT=25060
DB_USER=doadmin
PGPASSWORD= 

### ALC
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 default -f users.sql 

### Migration
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 api_app -f api_app/forge.sql
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 adm_app -f adm_app/forge.sql


PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 api_app -f tds_app/forge.sql
##PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 adm_app -f adm_app/forge.sql

### Roles
## PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_NAME} -f api_app/setup.sql
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 adm_app -f adm_app/setup.sql

### Migration
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 api_app -f api_app/forge.sql
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 adm_app -f adm_app/forge.sql

#DB_NAME=${DB_NAME} PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_NAME} -f forge.sql api_app
#DB_NAME=${DB_NAME} PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_NAME} -f setup.sql ${DB_NAME}

#Cleanup 

#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_HOST} -f cleanup_adm.sql
### Restore database snapshot ###
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_HOST} -d adm_app -f adm/forge.sql
#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_HOST} -d api_app -f api/forge.sql

#PGPASSWORD=${PGPASSWORD} psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_HOST} -f roles.sql
#nohup time psql -U ${DB_USER} -h ${DB_HOST} -p 25060 ${DB_HOST} -d ${DB_NAME} & >> restore_log.txt

## PGPASSWORD=b71hyo2ek9dtb0yr psql -U doadmin -h dev-storage-test-do-user-8326191-0.b.db.ondigitalocean.com -p 25060 -d defaultdb