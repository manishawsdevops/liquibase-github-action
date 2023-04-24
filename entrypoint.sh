#!/bin/sh -l

echo "Hello $1"
echo "Heloo $who-to-greet"
echo "Testing the Github Actions Creation"
time=$(date)
ls
liquibase --version
echo "time=$time" >> $GITHUB_OUTPUT