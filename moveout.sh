#!/bin/bash

echo "Staring moving dot-files from remote to your local..."
echo "Moving .vimrc..."
cp ./.vimrc ~/.
echo "Done"


echo "Staring moving dot-files from remote to your local..."
echo "Moving .gitignore_global"
cp ./.gitignore_global ~/.
echo "Done"

echo "staring moving dot-files from remote to local"
echo "moving .zshrc..."
cp ./.zshrc ~/.
echo "done"

echo "staring moving dot-files from local to remote"
echo "moving OceaNext vim theme..."
cp ./OceanicNext.vim ~/.vim/colors/.
echo "done"
