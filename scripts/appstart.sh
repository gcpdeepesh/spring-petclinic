#!/bin/sh
echo 'Killing if existing process'
killall -9 java
echo 'Starting application at: ' `date`
java -jar /opt/app/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar > /dev/null 2>&1 &
