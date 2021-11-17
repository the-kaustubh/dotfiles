#!/usr/bin/env bash

# Styling
bold="$(tput bold)"
normal="$(tput sgr0)"

# Colors
red="$(tput setaf 161)"
green="$(tput setaf 156)"
purple="$(tput setaf 127)"
blue="$(tput setaf 105)"
cyan="$(tput setaf 45)"

branch=$(git branch | grep "*" | awk '{print $2}')
allfiles=$(git ls-tree -r $branch --name-only | sed '/ignore/d' | sed '/install/d' | sed '/styling/d' | sed '/README/d' )

function createSymlinks() {
  for b in $allfiles
  do
    confirmYN "Do you want to install $blue$bold$b$normal : [y/N]"
    if [ $? -eq 0 ]
    then
      if [[ -f ~/$b ]]
      then
        echo " Removing $bold$b$normal ..."
        rm -f ~/$b
        echo " Removed $bold$b$normal"
      fi
      echo "  Creating symlink to $bold$(pwd)/$b$normal"
      echo ""
      ln -s $(pwd)/$b ~/$b
    fi

  done
  return 0
}

function install_from_git() {
  echo "Cloning $1"
  dirname=$(echo $1 | tr / ' ' | tr '.' ' ' | awk '{ print $2 }')
  git clone https://github.com/$1 1>/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Cloned $1"
  fi
  echo "Installing $1"
  cargo install --path $dirname
  if [ $? -eq 0 ]; then
    echo "Installed $1 successfully"
    rm -rf $dirname
  fi
  return 0
}

function confirmYN() {
  read -r -p "${1:-Are you sure: [y/N]} " response
  case "$response" in
    [yY])
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

if ! command -v rust
then
  echo "You need to have rust installed"
  confirmYN "Do you want to install$cyan$bold rust$normal? : [y/N]"
  if [ $? -eq 0 ]; then
    echo "Installing rust"
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    echo "$bold Need to install following dependencies: exa fd bat zoxide $normal"
    install_from_git ajeetdsouza/zoxide.git
    install_from_git sharkdp/bat.git
    install_from_git sharkdp/fd.git
    install_from_git ogham/exa.git
  fi
fi
createSymlinks
echo ""
echo "$green$bold Installed dotfiles and rust dependencies$normal"
