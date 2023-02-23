#!/bin/bash

# Generating databse params
echo "Composing MYSQL database"

# Check if there is an ENV file
# If no ENV file, generate an env file
if [ ! -e .env ]; then
  echo "Creating new Docker container"

  echo "Writing password to .env file"

  echo "MASTER_PASSWORD=$1" >> .env
fi

docker compose up -d

echo "Waiting for the MySQL server to finish initializing"
while ! docker exec -it passkey-mysql mysql -uroot -p$1 -h 127.0.0.1 --protocol=TCP -e "status" &> /dev/null ; do
    echo "Waiting for database connection..."
    sleep 5
done 