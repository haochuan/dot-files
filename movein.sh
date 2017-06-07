
#!/bin/bash

echo "Staring moving dot-files from local to remote"
echo "Moving .vimrc..."
cp ~/.vimrc ./
echo "Done"

echo "staring moving dot-files from local to remote"
echo "moving .gitignore_global..."
cp ~/.gitignore_global ./
echo "done"

echo "staring moving dot-files from local to remote"
echo "moving .zshrc..."
cp ~/.zshrc ./
echo "done"

echo "staring moving dot-files from local to remote"
echo "moving OceaNext vim theme..."
cp ~/.vim/colors/OceanicNext.vim ./
echo "done"

 
