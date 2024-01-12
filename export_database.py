import os

# Export datadase as SQL Dump with mysqldump
os.system('mysqldump -u tiko -p --host mysql-5b2bc8dc-o277c36e9.database.cloud.ovh.net --port 20184 SockWorld > database_SockWorld.sql')

# Import dump into database
# os.system('mysql -p -u [user] [database] < backup-file.sql')