import os

# Export datadase as SQL Dump with mysqldump
os.system('mysqldump -u <user_name> -p --host <hostname> --port <listening_port> <database_name> > database_SockWorld.sql')

# Import dump into database
# os.system('mysql -p -u <user> <database> < backup-file.sql')
