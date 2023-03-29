#!/usr/bin/env bash
echo "Script to set .zshenv to set ZDOTDIR to zsh"
ZSHENV="$HOME/.zshenv"
ZSHDIR="$HOME/zsh"
# Delete existing file (if any)
[ -f "$ZSHENV" ] && trash "$ZSHENV"
# Create new link to file in ZSH dir
ln -s "$ZSHDIR/zshenv" "$ZSHENV"
echo "Done!"
