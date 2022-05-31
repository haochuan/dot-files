#! /bin/bash

# link config files in this repo to machines ~

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BACKUP_DIR=~/.dotfiles_backup/$(date +%Y-%m-%d_%T)


for file in $(find $REPO_DIR -maxdepth 1 -iname '.*' -not -path '*/.git' -not -path '*/nvim')
do
  filename=$(basename $file)
  mkdir -p $BACKUP_DIR
  mv "$HOME/$filename" "$BACKUP_DIR" 2>/dev/null
  rm -rf "$HOME$filename"
  echo " $file => ~/$filename"
  ln -s "$file" ~
done

# Copy custom nvchad config
if ! [ -d $REPO_DIR/nvim/ ]; then
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.config/nvim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1; nvim
fi


if ! [ -d $REPO_DIR/nvim/lua/custom/ ]; then
  cp -R $REPO_DIR/.config/nvchad/ $HOME/.config/nvim/lua/custom/
fi
