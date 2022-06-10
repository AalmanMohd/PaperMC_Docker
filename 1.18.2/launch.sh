#!/bin/bash

cd PaperMC
MC_VERSION=1.18.2
URL=https://papermc.io/api/v2/projects/paper/versions/${MC_VERSION}
if [${BUILD_NUM} = latest]
then
  BUILD_NUM=$(wget -qO - $URL | jq '.builds[-1]')
fi
JAR_NAME=paper-${MC_VERSION}-${BUILD_NUM}.jar
URL=${URL}/builds/${BUILD_NUM}/downloads/${JAR_NAME}

if [ ! -e ${JAR_NAME} ]
then
  rm -f *.jar
  wget ${URL} -O ${JAR_NAME}
  if [ ! -e eula.txt ]
  then
    java -jar ${JAR_NAME}
    sed -i 's/false/true/g' eula.txt
  fi
fi

if [ ! -z "${RAM}" ]
then
  JAVA_ARGS="-Xms${RAM} -Xmx${MC_RAM} ${JAVA_ARGS}"
fi

exec java -server ${JAVA_ARGS} -jar ${JAR_NAME} nogui
