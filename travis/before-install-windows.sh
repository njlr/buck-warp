#!/bin/bash

choco install -y zip
choco install -y buck

export JAVA_HOME="/c/Program Files/Java/jdk1.8.0_201"
export PATH="$JAVA_HOME/bin:$PATH"

java -version
