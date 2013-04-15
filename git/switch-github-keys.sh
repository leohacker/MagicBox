#!/bin/bash

function usage {
    echo "Usage: $0 adobe|github"
    exit -1
}

if [ $# != 1 ]; then
    echo "Only one argument needed to specify the git repository."
    usage
fi

if [ $1 == "adobe" ]; then
    cp -f ./gitadobe-keys/id_rsa* .
elif [ $1 == "github" ]; then
    cp -f ./github-keys/id_rsa* .
else
    echo "$1 is not a known git repository name."
    usage
fi
