#!/bin/sh
if [ "${SILENT:-0}" != "1" ]; then
    set -uxe
fi

has_command() {
    command -v "$1" 2> /dev/null 1>&2
    echo "$?"
}

if [ "$(has_command curl)" -eq "0" ]; then
    __fetch="curl -Ls"
elif [ "$(has_command wget)" -eq "0" ]; then
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
        if [ "${SKIP_UPDATE:-0}" != "1" ]; then
            cd "$2"
            git pull
        fi
    else
        git clone "$1" "$2"
    fi
    cd "$2"
    if [ "${SKIP_UPDATE:-0}" != "1" ]; then
        git submodule update --init --recursive -j 9
    fi
    cd "$cd"
}

loader() {
    if [ -z "$2" ]; then
        target="$1"
    else
        target="$2"
        if [ "${SILENT:-0}" != "1" ]; then
            set +x
            echo
            echo "##############################"
            echo "$1"
            echo "##############################"
            set -x
        fi
    fi
    # shellcheck disable=1090,2039
    . "$target"
}
