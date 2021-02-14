#!/usr/bin/env zsh

_PATH="$("$HOME/.pathensure/pathensure.sh" "$HOME/.pathensure/entries.txt")"
echo 'Setting $PATH to '"${_PATH}"
export PATH="${_PATH}"

echo 'Setting the following environment variables:'
cat "$HOME/.envensure/entries.sh"
source "$HOME/.envensure/entries.sh"