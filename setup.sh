# Install libraries and setup

# update homebrew
if [ -x "$(command -v brew)" ]; then
  brew update
  brew upgrate

  brew install bat
  brew install exa
  brew install ripgrep
  brew install starship
fi

# Rust related

# Check that rust is installed... otherwise should run this
if ! [ -x "$(command -v cargo)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# cargo install \
#   bat \
#   ripgrep \
#   starship

# install oh-my-zsh
if ! [ -d $HOME/.config/oh-my-zsh/ ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-auto-suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Latest nvim
if [ -x "$(command -v brew)" ]; then
  brew install --HEAD luajit
  brew install --HEAD neovim
fi


# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
