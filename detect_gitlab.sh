#!/bin/bash
# this curls an ip:port and tries to detect the GitLab help page within 3 secs 
if [ "$#" -ne 2 ]; then 
    echo -ne "this script takes exactly 2 argument : the first is the ip address, the second the port number. \n example
: ./detect_gitlab.sh 3.85.25.102 80\n"
    exit 1
fi

if $(curl -v -m 3 -i http://$1:$2/help 2>&1 | grep -q  "_gitlab_session"); then echo 'GitLab found'; else echo 'No open GitLab found'; fi
