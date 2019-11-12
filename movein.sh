#!/bin/bash

echo "Staring moving dot-files from local to remote"

echo "Moving .vimrc..."
cp ~/.vimrc ./
echo "Done"

echo "Moving .ctags..."
cp ~/.ctags ./
echo "Done"

echo "moving .gitignore_global..."
cp ~/.gitignore_global ./
echo "done"

echo "moving .gitconfig..."
cp ~/.gitconfig ./
echo "done"

echo "moving .zshrc..."
cp ~/.zshrc ./
echo "done"

echo "moving .eslintrc.json ..."
cp ~/.eslintrc.json ./
echo "done"

echo "moving OceaNext vim theme..."
cp ~/.vim/colors/OceanicNext.vim ./
echo "done"

echo "moving startship config..."
cp ~/.config/starship.toml ./
echo "done"

 
