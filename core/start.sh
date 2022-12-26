#!/data/data/com.termux/files/usr/bin/zsh

setopt EXTENDED_GLOB

termux-setup-storage
pkg upgrade -y
pkg autoclean

pkg install -y zsh && chsh -s zsh

pkg install -y git
pkg install -y exa
pkg install -y termux-services
pkg install -y nodejs
pkg install -y vim

mkdir -p ~/.vim/colors

# OceanicNext
rm -f ~/.vim/colors/OceanicNext.vim
curl -sL https://raw.githubusercontent.com/mhartington/oceanic-next/master/colors/OceanicNext.vim > ~/.vim/colors/OceanicNext.vim

if [ ! -d "$HOME/.my" ]; then
  git clone --depth=1 https://github.com/kud/my-termux.git ~/.my
else
  cd ~/.my
  git pull
  cd -
fi

if [ ! -d "$HOME/.powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
else
  cd ~/.powerlevel10k
  git pull
  cd -
fi

if [ ! -d "$HOME/.znap" ]; then
  git clone --depth=1 https://github.com/marlonrichert/zsh-snap.git ~/.znap
  source ~/.znap/install.zsh
else
  znap pull
fi

for dotfile in "${ZDOTDIR:-$HOME}"/.my/dotfiles/.{aliases,gitconfig,gitignore_global,zshrc,vimrc}; do
  ln -sf "$dotfile" "${ZDOTDIR:-$HOME}/${dotfile:t}" 2> /dev/null
done

touch $HOME/.zshrc_local

curl --silent https://raw.githubusercontent.com/kud/my-termux/main/core/npm.sh -H 'Cache-Control: no-cache, no-store; Pragma: no-cache'|zsh

echo " "
echo "Done! Please exit and start Termux."

exit
