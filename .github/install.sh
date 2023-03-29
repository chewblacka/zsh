#!/usr/bin/env bash

# Script to set up my zsh dotfiles
# 1. In home folder run:
# git clone https://github.com/chewblacka/zsh.git
# 2. Then run this script:
# ./zsh/.github/install.sh

echo "Script to install my zsh files"
  
ZDOTDIR="$HOME/zsh"
cd "$ZDOTDIR" || exit
echo "First we install antidote"
git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}/.antidote"
echo
echo "Next we write out ~/.zshenv to set ZDOTDIR to ~/zsh"
ZSHENV="$HOME/.zshenv"
# Delete existing zshenv file (if any)
[ -f "$ZSHENV" ] && trash "$ZSHENV"
# Create new link to zshenv file in ZSH dir
ln -s "$ZDOTDIR/zshenv" "$ZSHENV"

echo
echo "Finally we link files to their dot links"
dotfiles=(
# Files / folders to create dot links for 
p10k.zsh
zsh_history
zsh_plugins.txt
zshrc
antidote # directory 
)

for link in "${dotfiles[@]}"
do
  # if the dotfile doesn't exist create it
  if [ ! -e ".$link" ] then 
    ln -s "$link" ".$link"
  else
    # otherwise if the file/dir doesn't exist link it to dotfile
    [ ! -e "$link" ] && ln -s ".$link" "$link"
  fi
done

echo "Done!"
