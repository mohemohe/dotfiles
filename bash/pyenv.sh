#!/bin/bash

__pyenv_version_ps1 ()
{
    local ret=$?;
    if [ -n "${PYENV_VIRTUAL_ENV}" ]; then
        echo -n "(${PYENV_VIRTUAL_ENV##*/}) "
    fi
    return $?
}

command -v pyenv &> /dev/null
if [[ "${?}" == "0" ]]; then {
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PS1="\$(__pyenv_version_ps1):${PS1}"
} fi
