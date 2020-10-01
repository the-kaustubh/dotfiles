
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
