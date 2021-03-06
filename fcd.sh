#!/bin/bash
#
# Fast change directory. Should be changed in ~/.bashrc file, where it is a
# function, too. Is doubled here, to be used from subshells and the like, where
# bash functions from rc-file aren't accessible.
#
. fcd
fcd $1
