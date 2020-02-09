#!/bin/bash

echo `git show --format="%h" HEAD | head -1` > build_info.txt
echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt
git clone https://github.com/percona/mongodb_exporter
cd mongodb_exporter
docker build -t $USER_NAME/mongodb-exporter .
docker push $USER_NAME/mongodb-exporter
