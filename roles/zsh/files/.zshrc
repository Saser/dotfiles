#!/usr/bin/env zsh

source "${ZPLUG_HOME}/init.zsh"

# Syntax highlighting for the shell.
zplug "${ZSHPLUGINS}/zsh-syntax-highlighting", \
      from:local, \
      defer:2

# Search shell command history by substring matching.
zplug "${ZSHPLUGINS}/zsh-history-substring-search", \
      from:local, \
      defer:3

# Load my own custom prompt.
fpath=(${HOME}/.prompt ${fpath})
autoload -Uz promptinit
promptinit
prompt saser

# Load plugins.
zplug load --verbose

# Use vi-style keybindings.
bindkey -v

# Define keybindings for zsh-history-substring-search.
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

#
# Settings for shell command history.
#

# Number of events to keep in internal history (current session).
HISTSIZE=15000
# File in which to store history.
HISTFILE="${HOME}/.zhistory"
# The number of events to store in the HISTFILE.
SAVEHIST=10000

# For each event, also record its starting time and executing time.
setopt EXTENDED_HISTORY
# Remove the oldest duplicate event when trimming the internal history.
setopt HIST_EXPIRE_DUPS_FIRST
# If the command to be entered into the history is a duplicate of the previous
# one, do not enter it. Also, if the command to be entered is a duplicate of any
# previous event---not only the previous one---remove the older event first.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
# If a command begins with at least one leading space, do not enter it into the
# history.
setopt HIST_IGNORE_SPACE
# Removes older commands that are duplicates of newer ones, when writing out the
# history file.
setopt HIST_SAVE_NO_DUPS
# Do not execute a command directly on history expansion (i.e. `sudo !!`) does
# not directly execute `sudo <previous command>`, but rather enters it on the
# command line to be executed.
setopt HIST_VERIFY
# Incrementally write to the history file, instead of writing when the shell
# exits. Note that the manpages for zsh says that this option and the
# INC_APPEND_HISTORY and SHARE_HISTORY options are considered mutually
# exclusive.
setopt INC_APPEND_HISTORY_TIME

# Load aliases.
for f in "${ZSHALIASES}"/*.zsh; do
    echo source "${f}"
    source "${f}"
done

# Load any extra scripts.
for f in "${ZSHEXTRAS}"/*.zsh; do
    echo source "${f}"
    source "${f}"
done
