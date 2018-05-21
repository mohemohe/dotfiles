#!/bin/sh
set -uxe

has_command() {
    set +e
    command -v $1 2> /dev/null 1>&2
    echo "$?"
    set -e
}

if [ `has_command curl` ]; then
    __fetch="curl -L"
elif [ `has_command wget` ]; then
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
    # shellcheck disable=1090,2039
    source "$target"
}