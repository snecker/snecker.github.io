#!/bin/bash
###env
export ENV=prod
###ip
export IP=XX.XX.XX.XX
###RUN deploy.bat
"$( cd $(dirname $0) ; pwd -P )"/deploy.sh