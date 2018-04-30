#!/bin/sh
set -uxe

set +e
command -v curl 2> /dev/null 1>&2
has_curl="$?"
command -v wget 2> /dev/null 1>&2
has_wget="$?"
set -e

if [ "$has_curl" ]; then
    __fetch="curl -L"
elif [ "$has_wget" ]; then
    __fetch="wget -O -"
else
    echo curlかwgetをインストールして再実行してください
    exit 1
fi

fetch() {
    $__fetch "$*" 
}

git_pull_or_clone() {
    cd="$(pwd)"
    if [ -d "$2" ]; then
        cd "$2"
        git pull
        git submodule foreach git pull origin master
    else
        git clone --recursive "$1" "$2"
    fi
    cd "$cd"
}

loader() {
    if [ -z "$2" ]; then
        target=$1
    else
        target=$2
        set +x
        echo
        echo "##############################"
        echo "$1"
        echo "##############################"
        set -x
    fi
    source "$target"
}