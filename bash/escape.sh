#!/bin/bash
################################################################################
# Bashor Framework
#
# LICENSE:
# This software is released under the GNU Lesser General Public License version 3.
# http://www.gnu.org/licenses/lgpl-3.0.txt
#
# Copyright 2010-2013 the bashor project authors. All rights reserved.
################################################################################

##
# escape string for regex
#
# $1    string  To escape
# $2    string  Expression limiter
# $?    0:OK    1:ERROR
CLASS_Bashor_Escape_regEx()
{
    local replacement=`printf '%s' "${2:-/}" | sed 's#/#\\\\/#g'`

    printf '%s' "$1" \
        | sed 's#\([.^$*\\]\)#\\\1#g' \
        | sed 's#\([]]\|[[]\)#[\1]#g' \
        | sed 's/'"$replacement"'/\\'"$replacement"'/g'
        
    return "$?"
}

##
# escape string for regex replacement
#
# $1    string  To escape
# $2    string  Expression limiter
# $?    0:OK    1:ERROR
CLASS_Bashor_Escape_regExReplacement()
{
    local replacement=`printf '%s' "${2:-/}" | sed 's#/#\\\\/#g'`

    printf '%s' "$1" \
        | sed 's#\([\\]\)#\\\1#g' \
        | sed 's/'"$replacement"'/\\'"$replacement"'/g'
    
    return "$?"
}
