#!/bin/zsh

setopt prompt_subst

# TODO
PROMPT='$($HOME/dev/repo/private/puck/_build/default/bin/main.exe $?)'
RPROMPT=''
