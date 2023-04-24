#!/bin/sh -l

echo "Hello $1"
echo "DB_URL: $2"
echo "DB_PASSWORD: $3"
echo "Testing the Github Actions Creation"
time=$(date)
ls
liquibase --version
echo "time=$time" >> $GITHUB_OUTPUT