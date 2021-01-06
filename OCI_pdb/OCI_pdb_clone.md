# Database clone

## Environment

File lists:
```
[oracle@source_host /home/oracle/dba_code/upgrade/clone]$ ls -l
total 12
-rw-r--r-- 1 oracle dba 267 Jan  6 13:09 CDB18_REMOTE_CLONE.ENV
-rwxr--r-- 1 oracle dba 423 Jan  6 13:09 link_create_clone_DB_link.sh
-rwxr--r-- 1 oracle dba 292 Jan  6 13:08 user_create_remote_clone_DB.sh
[oracle@source_host /home/oracle/dba_code/upgrade/clone1 clone]$
```

## On source host create remote user

### run  ___./user_create_remote_clone_DB.sh CDB18___

```
[oracle@source_host /home/oracle/dba_code/upgrade/clone]$ ./user_create_remote_clone_DB.sh CDB18

SQL*Plus: Release 18.0.0.0.0 - Production on Wed Jan 6 13:15:11 2021
Version 18.10.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.


Connected to:
Oracle Database 18c EE Extreme Perf Release 18.0.0.0.0 - Production
Version 18.10.0.0.0

SQL>
    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 PDB18                          READ WRITE NO
         4 CM121320                       READ WRITE NO
         5 HR121320                       READ WRITE NO
SQL> SQL>
User created.

SQL>
Grant succeeded.

SQL>
Grant succeeded.

SQL> Disconnected from Oracle Database 18c EE Extreme Perf Release 18.0.0.0.0 - Production
Version 18.10.0.0.0
[oracle@aupp-hroradb-f9exx1 clone]$
```
## On target host create and test remote link

### run  ___./link_create_clone_DB_link.sh CDB18___

```
[oracle@target_host /home/oracle/dba_code/upgrade/clone]$ ./link_create_clone_DB_link.sh CDB18

SQL*Plus: Release 18.0.0.0.0 - Production on Wed Jan 6 13:15:44 2021
Version 18.10.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.


Connected to:
Oracle Database 18c EE Extreme Perf Release 18.0.0.0.0 - Production
Version 18.10.0.0.0

SQL>
    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 PDB18                          READ WRITE NO
SQL>
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
cdb_cluster_name                     string
cell_offloadgroup_name               string
db_file_name_convert                 string
db_name                              string      CDB18
db_unique_name                       string      CDB18_phx298
global_names                         boolean     TRUE
instance_name                        string      CDB181
lock_name_space                      string
log_file_name_convert                string
pdb_file_name_convert                string
processor_group_name                 string

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
service_names                        string      CDB18_phx298.hlthedgexap.pvthl
                                                 thedgedr.oraclevcn.com
SQL>
Database link dropped.

SQL> SQL>   2    3    4
Database link created.

SQL> SQL>
Session altered.

SQL>
FILE_NAME
--------------------------------------------------------------------------------
+DATAC1/CDB18_IAD38Z/DATAFILE/system.1079.1054270695
+DATAC1/CDB18_IAD38Z/DATAFILE/sysaux.1080.1054270695
+DATAC1/CDB18_IAD38Z/DATAFILE/undotbs1.1081.1054270695
+DATAC1/CDB18_IAD38Z/DATAFILE/users.1100.1054272077
+DATAC1/CDB18_IAD38Z/DATAFILE/undotbs2.1097.1054270997

SQL> Disconnected from Oracle Database 18c EE Extreme Perf Release 18.0.0.0.0 - Production
Version 18.10.0.0.0
[oracle@target_host /home/oracle/dba_code/upgrade/clone]$
```
