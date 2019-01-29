#!/usr/bin/env bash

BUCK_HOME=${BASH_SOURCE%/*}

export JAVA_HOME="$BUCK_HOME/jre";

"$BUCK_HOME/bin/buck" "$@"
