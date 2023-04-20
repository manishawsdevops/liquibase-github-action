#!/bin/sh -l

echo "Hello $1"
echo "Testing the Github Actions Creation"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT