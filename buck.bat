@echo off

setlocal EnableDelayedExpansion

set BUCK_HOME=%~dp0

set JAVA_HOME=%BUCK_HOME%jre

python %BUCK_HOME%bin\buck
