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

tick="✔️ "
link="🔗 "
package="📦 "
trash="🗑️ "
sparkles="✨ "
questionMark="❓ "

branch=$(git branch | grep "*" | awk '{print $2}')
allfiles=$(git ls-tree -r $branch --name-only | sed '/ignore/d' | sed '/install/d' | sed '/styling/d' | sed '/README/d' )

function allDependencies() {
    echo "$bold The dotfiles have following dependencies: exa fd bat zoxide $normal"
    checkDependency ajeetdsouza/zoxide
    checkDependency sharkdp/bat
    checkDependency sharkdp/fd
    checkDependency ogham/exa
}

function createSymlinks() {
  for b in $allfiles
  do
    confirmYN "  Do you want to install $blue$bold$b$normal$questionMark: [y/N]"
    if [ $? -eq 0 ]
    then
      if [[ -f ~/$b ]]
      then
        echo -n " $trash Removing $bold$b$normal ..."
        rm -f ~/$b
        echo "done"
      fi
      echo "  $link Creating symlink to $bold$(pwd)/$b$normal"; echo
      ln -s $(pwd)/$b ~/$b
    fi
  done
  source .bashrc
  return 0
}

function checkDependency() {
  program_name=$(echo $1 | tr / ' ' | awk '{print $2}')
  if command -v $program_name >/dev/null
  then
    echo " $package Dependency $bold$program_name$normal already satisfied!"
  else
    echo " $package $program_name was not found."
    confirmYN "Do you want to install it : [y/N] "
    if [ $? -eq 0 ]
    then
      install_from_git $1
    else
      echo "Skipping $package $program_name"
    fi
  fi
}

function install_from_git() {
  echo "Cloning $1"
  dirname=$(echo $1 | tr / ' ' | awk '{ print $2 }')
  git clone https://github.com/$1.git 1>/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Cloned $1"
  fi
  echo "Installing $1"
  cargo install --path $dirname
  if [ $? -eq 0 ]; then
    echo " $tick Installed $package $1 successfully"
    # rm -rf $dirname
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

if ! command -v rustc >/dev/null
then
  echo "There are some dependencies that need Rust compiler"
  confirmYN "Do you want to install$cyan$bold rust$normal$questionMark : [y/N]"
  if [ $? -eq 0 ]; then
    echo "Installing rust"
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    echo " $tick Installed Rust"
    PATH=$PATH:/home/$USER/.cargo/bin
  else
    echo "Skipping rust and dependencies. Using built-in defaults"
  fi
else
  echo " $tick Rust is already present looking for other dependencies"
  allDependencies
fi
createSymlinks
echo; echo "$green$bold $sparkles Installed dotfiles and rust dependencies$normal"
