#!/bin/bash
###env
export ENV=dev
###ip
export IP=XX.XX.XX.XX
###RUN deploy.bat
"$( cd $(dirname $0) ; pwd -P )"/deploy.sh
