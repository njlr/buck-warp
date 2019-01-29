#!/usr/bin/env bash

export JAVA_HOME=${BASH_SOURCE%/*}/jre;

${BASH_SOURCE%/*}/bin/buck "$@"
