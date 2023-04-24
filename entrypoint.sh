#!/bin/sh -l

echo "DB_URL: $1"
echo "DB_USERNAME: $2"
echo "DB_PASSWORD: $3"
echo "DB_FAMILY: $4"
echo "DB_CHANGELOGFILE: $5"
echo "Dry_Run: $6"

echo "Deploying objects into $4 Environment"

if [ $4 == "snowflake"]
then
    driver = "net.snowflake.client.jdbc.SnowflakeDriver"
fi

echo "Checking the Connection for $4 Environment"
liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" status --verbose

echo "Executing the Pre-check the SQL objects into $4 Env"
liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" updateSQL

echo "Deploying objects into $4 Environment"
if [ $6 == "No"]
then
    echo "Deploying the objects into $4 environment"
    # liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" update
fi