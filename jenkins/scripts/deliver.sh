# #!/usr/bin/env bash

# echo 'The following Maven command installs your Maven-built Java application'
# echo 'into the local Maven repository, which will ultimately be stored in'
# echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
# echo 'volume).'
# set -x
# mvn jar:jar install:install help:evaluate -Dexpression=project.name
# set +x

# echo 'The following command extracts the value of the <name/> element'
# echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
# set -x
# NAME=`mvn -q -DforceStdout help:evaluate -Dexpression=project.name`
# set +x

# echo 'The following command behaves similarly to the previous one but'
# echo 'extracts the value of the <version/> element within <project/> instead.'
# set -x
# VERSION=`mvn -q -DforceStdout help:evaluate -Dexpression=project.version`
# set +x

# echo 'The following command runs and outputs the execution of your Java'
# echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
# set -x
# java -jar target/${NAME}-${VERSION}.jar


@echo off

echo The following Maven command installs your Maven-built Java application

echo into the local Maven repository, which will ultimately be stored in

echo Jenkins's local Maven repository (and the "maven-repository" Docker data

echo volume).

rem Enable command echoing

setlocal enabledelayedexpansion

rem Install your Maven jar and evaluate the project name

mvn jar:jar install:install help:evaluate -Dexpression=project.name

rem Extract the value of the  element from pom.xml

set OUTPUT_NAME=mvn -q -DforceStdout help:evaluate -Dexpression=project.name

for /f "delims=" %%i in ('%OUTPUT_NAME%') do set NAME=%%i

echo The name of the project is: !NAME!

rem Extract the value of the  element from pom.xml

set OUTPUT_VERSION=mvn -q -DforceStdout help:evaluate -Dexpression=project.version

for /f "delims=" %%i in ('%OUTPUT_VERSION%') do set VERSION=%%i

echo The version of the project is: !VERSION!

echo The following command runs and outputs the execution of your Java

echo application (which Jenkins built using Maven) to the Jenkins UI.

java -jar target!NAME!-!VERSION!.jar

