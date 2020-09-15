#!/bin/bash
sendto=hall3jl@mail.uc.edu
ip=$(ip a | grep 'dynamic ens192' | awk '{print $2}')
content="Hello! This email is being sent from $HOSTNAME/$ip. The date is $(date). $HOSTNAME is currently running bash version $BASH_VERSION."

#echo $content
echo $content | mail -s "IT3080C Lab 2" $sendto
