#!/bin/zsh

# turn on command substitution in the prompt 
# this allows us to run the puck executable `main.exe`
setopt prompt_subst

# TODO
# `esy build` puts the executable in this folder
# replace `$HOME/dev/repo/private/` with your path to the `puck` repo
PROMPT='$($HOME/dev/repo/private/puck/_build/default/bin/main.exe $?)'

# some tools, like oh-my-zsh (which I don't use), might set this for you, I don't like it
RPROMPT=''
