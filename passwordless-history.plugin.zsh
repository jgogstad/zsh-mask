# ZSH

HISTORY_EXCLUDE_PATTERN="^ |password|//[^/]+:[^/]+@|(KEY|TOKEN|SECRET)=|Authorization: ?[^\$]"

function zshaddhistory() {
  emulate -L zsh
  unsetopt case_match
  if ! [[ "$1" =~ $HISTORY_EXCLUDE_PATTERN ]] ; then
      print -Sr -- "${1%%$'\n'}"
  else
      return 1
  fi
}
