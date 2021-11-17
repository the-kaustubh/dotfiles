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

	git add .
	git commit -m "$1"

  if [[ -z $2 ]]; then
		echo "Did not find any remote. Exiting..."
		return 0
	else
		git push "$2" master
	fi
	return 0
}

function zipit() {
	if [[ -z $1  ]]; then
		echo "Provide directory name"
		return 1
	fi

	tar -cvf $1.zip $1
	return 0

}

function mkcd() {
  mkdir $1; cd $1;
}

function bdiff() {
  git diff --name-only --diff-filter=d | xargs bat --diff
}
