#!/bin/sh -l

echo "DB_URL: $1"
echo "DB_USERNAME: $2"
echo "DB_PASSWORD: $3"
echo "DB_FAMILY: $4"
echo "DB_CHANGELOGFILE: $5"
echo "Testing the Deployment into Snowflake"

ls

liquibase --url="$1" --username="$2" --password="$3" --driver="net.snowflake.client.jdbc.SnowflakeDriver" --changeLogFile="$5" status --verbose

# time=$(date)
# echo "time=$time" >> $GITHUB_OUTPUT