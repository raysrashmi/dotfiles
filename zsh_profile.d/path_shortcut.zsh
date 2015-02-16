export ALIASFILE=$HOME/checkouts/dotfiles/aliasrc

function short_path {
  if  [ $2 ]
  then
    echo "with argumentsssssssssssssss"
    echo "alias $1='cd $2'" >> "$ALIASFILE"
  else
    echo "alias $1='cd `pwd`'" >> "$ALIASFILE"
  fi

  echo "created shortcut for $1"
}
