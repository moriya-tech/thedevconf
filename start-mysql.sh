#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


export MYSQL_ROOT_USER="root"
export MYSQL_ROOT_PASSWORD="pass$USER$RANDOM"
export MYSQL_HOST="127.0.0.1"
export MYSQL_PORT="3307"
export MYSQL_DB="globalcode"

echo "Generated password is $MYSQL_ROOT_PASSWORD"

echo "Setting Quarkus variables"
export DATASOURCE_URL="jdbc:mysql://$MYSQL_HOST:$MYSQL_PORT/$MYSQL_DB"
export DATASOURCE_USERNAME=$MYSQL_ROOT_USER
export DATASOURCE_PASSWORD=$MYSQL_ROOT_PASSWORD
export DATASOURCE_KIND="mysql"
export HIBERNATE_ORM_DATABASE_GENERATION="none"

echo "It is dangerous to go alone. Take this variables!"

mkdir -p $PWD/config/
echo "" > $PWD/config/application.properties
echo "quarkus.datasource.jdbc.url=$DATASOURCE_URL" >> $PWD/config/application.properties
echo "quarkus.datasource.username=$DATASOURCE_USERNAME" >> $PWD/config/application.properties
echo "quarkus.datasource.password=$DATASOURCE_PASSWORD" >> $PWD/config/application.properties
echo "quarkus.datasource.db-kind=$DATASOURCE_KIND" >> $PWD/config/application.properties
echo "quarkus.hibernate-orm.database.generation=$HIBERNATE_ORM_DATABASE_GENERATION" >> $PWD/config/application.properties
echo ""

cp -a $SCRIPT_DIR/config $SCRIPT_DIR/tdc-api/target/

cat $PWD/config/application.properties

echo ""
echo "Starting mysql container"
docker run --rm \
  --name $MYSQL_DB \
  -p 0.0.0.0:$MYSQL_PORT:3306 \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_DATABASE=$MYSQL_DB \
  -d mysql:latest

echo "Connect with:"
echo mysql --host=$MYSQL_HOST --port=$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DB



