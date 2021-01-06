. ${1}_REMOTE_CLONE.ENV

. ${HOME}/${CLONED_TO_ENV}.env
sqlplus / as sysdba <<EOF
show pdbs
show parameter name
DROP DATABASE LINK CLONE_LINK;

CREATE DATABASE LINK CLONE_LINK
 CONNECT TO ${CLONE_USER_NAME}
 IDENTIFIED BY "${CLONE_USER_PWD}"
 USING '${CLONE_REMOTE_HOST_IP}:${CLONE_REMOTE_HOST_PORT}/${CLONE_REMOTE_CDB_SERVICE}';

alter session set global_names=false;
select file_name from dba_data_files@clone_link;
EOF
