#!/bin/bash
#
# Switch the ssh key for github repositories: git.corp.adobe.com, github.com
# Usage:
#   github-keys.sh adobe|github

function usage {
    echo "Usage: $0 adobe|github"
    exit -1
}

if [ $# == 0 ]; then
    if cmp id_rsa ./gitadobe-keys/id_rsa &> /dev/null; then
        echo "adobe"
    elif cmp id_rsa ./github-keys/id_rsa &> /dev/null; then
        echo "github"
    else
        echo "Unknown repository"
    fi
    exit 0
fi

if [ $# != 1 ]; then
    echo "Please specify the repository name. Only one argument needed."
    exit -1
fi

if [ $1 == "adobe" ]; then
    cp -f ./gitadobe-keys/id_rsa* .
    chmod 0600 id_rsa
    chmod 0644 id_rsa.pub
elif [ $1 == "github" ]; then
    cp -f ./github-keys/id_rsa* .
    chmod 0600 id_rsa
    chmod 0644 id_rsa.pub
else
    echo "$1 is not a known git repository name."
    usage
fi
