#!/bin/bash
#gloabal setting
"$( cd $(dirname $0) ; pwd -P )"/restart.sh -Dspring.profiles.active=prod
