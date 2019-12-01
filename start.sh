#!/bin/sh
#--spring.profiles.active=test
ps -ef | grep im-client-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{print $2}' | xargs kill -9
cd /www/im-client
git pull
mvn clean package -Dmaven.test.skip=true
cd target
nohup java -Xms256m -Xmx256m -XX:NewSize=96m -XX:MaxNewSize=96m -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=64m  -jar im-client-0.0.1-SNAPSHOT.jar  &