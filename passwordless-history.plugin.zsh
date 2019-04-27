# ZSH

HISTORY_EXCLUDE_PATTERN="^ |password|PASSWORD|//[^/]+:[^/]+@"

function zshaddhistory() {
  emulate -L zsh
  unsetopt case_match
  if ! [[ "$1" =~ $HISTORY_EXCLUDE_PATTERN ]] ; then
      print -Sr -- "${1%%$'\n'}"
      fc -p
  else
      return 1
  fi
}
