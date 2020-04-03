#!/bin/bash
set -xe

if [ "$1" == "test" ]; then
  mvn clean package spring-boot:repackage
else
  mvn clean package -Dmaven.test.skip=true spring-boot:repackage
fi

cp target/conference-0.0.1-SNAPSHOT.war apache-tomcat-9.0.33/webapps
./apache-tomcat-9.0.33/bin/catalina.sh jpda run
