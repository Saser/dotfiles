#!/bin/sh
set -e
set -u
set -o pipefail

STOW_TARGET="${HOME}"

# Uninstall shell configuration.
stow --target "${STOW_TARGET}" --delete shell

# Uninstall tmux configuration.
stow --target "${STOW_TARGET}" --delete tmux

# Uninstall neovim configuration.
stow --target "${STOW_TARGET}" --delete neovim

# Uninstall X-related things, such as `.xinitrc`.
stow --target "${STOW_TARGET}" --delete xorg

# Uninstall sxhkd configuration.
stow --target "${STOW_TARGET}" --delete sxhkd

# Uninstall my scripts.
stow --target "${STOW_TARGET}" --delete scripts