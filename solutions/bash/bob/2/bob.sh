#!/usr/bin/env bash

set -o noglob

trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
    printf '%s' "$var"
}

main () {
  local trimmed
  trimmed=$(trim "$@")
  local len=${#trimmed}
  local lastchar=${trimmed:$len-1:1}

  if (( ${#trimmed} == 0 ))
    # empty string
    then echo 'Fine. Be that way!'
  elif [[ $trimmed =~ [A-Z] && ! $trimmed =~ [a-z] && $lastchar == '?' ]]
    # yelling question
    then echo "Calm down, I know what I'm doing!"
  elif [[ $lastchar == '?' ]]
    # not-yelling question
    then echo 'Sure.'
  elif [[ $trimmed =~ [A-Z] && ! $trimmed =~ [a-z] ]]
    # yelling not-question
    then echo 'Whoa, chill out!'
  else
    echo 'Whatever.'
  fi
}

# call main with all of the positional arguments
main "$@"
