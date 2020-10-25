#!/bin/bash

ex () 
{
 if [ -f $1 ]; then
  case $1 in
   *.tar.bz2) tar xjf $1 ;;
  esac
 else
  echo "'$1': implement more"
 fi
}

function jmpfile () {

	gcc $1 2>&1 | grep -P "^$1:\d+:\d+: error" > err.jmp
	gcc $1 2>&1 | grep -P "^$1:\d+:\d+: warning" > warn.jmp

}

function gitsync() {
  if [[ -z $1 ]]; then
		echo "Provide a commit message"
		return 1
	fi

  if [[ -z $1 ]]; then
		echo "Provide a commit message"
		return 1
	fi

  if [[ -z $2 ]]; then
		echo "Provide a remote"
		return 1
	fi

	git add .
	git commit -m "$1"
	git push "$2" master
	return 0
}
