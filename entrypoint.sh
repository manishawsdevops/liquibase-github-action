#!/bin/sh

echo "DB_URL: $1"
echo "DB_USERNAME: $2"
echo "DB_PASSWORD: $3"
echo "DB_FAMILY: $4"
echo "DB_CHANGELOGFILE: $5"
echo "Dry_Run: $6"

echo "Deploying objects into $4 environment"

if [ "$4" = "snowflake" ]; then
    driver="net.snowflake.client.jdbc.SnowflakeDriver"
fi

echo "Checking the connection for $4 environment"
liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" status --verbose

echo "Executing the pre-check for SQL objects in $4 environment"
liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" updateSQL

echo "Deploying objects into $4 environment"
if [ "$6" = "No" ]; then
    echo "Executing update in $4 environment"
    liquibase --url="$1" --username="$2" --password="$3" --driver="$driver" --changeLogFile="$5" update
else
    echo "This is a Dry Run Deployment - Please check the GitHub Actions logs for deployments that might occur in the next run if you select the Dry Run option as No"
fi
