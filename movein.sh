
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

echo "moving .zshrc..."
cp ~/.zshrc ./
echo "done"


echo "moving .jshintrc..."
cp ~/.jshintrc ./
echo "done"

echo "moving OceaNext vim theme..."
cp ~/.vim/colors/OceanicNext.vim ./
echo "done"

 
