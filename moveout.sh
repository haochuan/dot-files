#!/bin/bash

echo "Staring moving dot-files from remote to your local..."

echo "Moving .vimrc..."
cp ./.vimrc ~/.
echo "Done"

echo "Moving .ctags..."
cp ./.ctags ~/.
echo "Done"

echo "Moving .gitignore_global"
cp ./.gitignore_global ~/.
echo "Done"

echo "Moving .gitconfig"
cp ./.gitconfig ~/.
echo "Done"

echo "moving .zshrc..."
cp ./.zshrc ~/.
echo "done"


echo "moving .eslintrc.json ..."
cp ./.eslintrc.json ~/.
echo "done"

echo "moving OceaNext vim theme..."
cp ./OceanicNext.vim ~/.vim/colors/.
echo "done"
