#!/bin/env zsh

HISTORY_EXCLUDE_PATTERN='^ |//([^/]+:[^/]+)@|KEY[=:] *([^ ]+)|TOKEN[=:] *([^ ]+)|BEARER[=:] *([^ ]+)|PASSWO?R?D?[=:] *([^ ]+)|Authorization[=:] *([^'"'"'\"]+)|-us?e?r? ([^:]+:[^:]+) '

# See
# - https://zsh.sourceforge.io/Doc/Release/Functions.html for docs on zshaddhistory
# - https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html for docs on print
function zshaddhistory() {
  emulate -L zsh
  unsetopt case_match

  input="${1%%$'\n'}"
  if ! [[ "$input" =~ "$HISTORY_EXCLUDE_PATTERN" ]]; then
    print -Sr -- "$input"
  else
    nonempty=($match)

    if [[ $#nonempty -gt 0 ]]; then
      for m in "$nonempty[@]"; do
        n="${m##[\"\']}"
        input="${input/${n%%[\"\']}/...}"
      done

      print -Sr -- "$input"
    fi
    unset match
    return 1
  fi
}
