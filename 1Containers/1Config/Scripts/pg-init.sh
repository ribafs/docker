init.sh

#!/usr/bash
set -e

# init db & user
su - postgres -c "psql -c \"CREATE USER user1 WITH PASSWORD 'password';\""
su - postgres -c "psql -c \"CREATE DATABASE db1 WITH OWNER user1 ENCODING 'UTF8';\""

# init test db & user
su - postgres -c "psql -c \"CREATE USER user2 WITH PASSWORD 'password';\""
su - postgres -c "psql -c \"CREATE DATABASE db2 WITH OWNER user2 ENCODING 'UTF8';\""

# init schema
for SCRIPT in /scripts/*.sql
do
	su - postgres -c "psql -d db1 < $SCRIPT"
	su - postgres -c "psql -d db2 < $SCRIPT"
done

# grant access to all tables
su - postgres -c "psql -d db1 -c \"GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to user1;\""
su - postgres -c "psql -d db2 -c \"GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to user2;\""

exit 0
