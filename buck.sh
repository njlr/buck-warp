#!/bin/bash

export JAVA_HOME=${BASH_SOURCE%/*}/jdk;

${BASH_SOURCE%/*}/bin/buck "$@"
