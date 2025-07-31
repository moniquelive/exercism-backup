#!/usr/bin/env bash

set -o noglob

isEmpty() {
  (( ${#trimmed} == 0 ))
}

isYellingQuestion() {
  isYelling && isAsking
}

isAsking() {
  [[ $lastchar == '?' ]]
}

isYelling() {
  [[ $trimmed =~ [[:upper:]] && ! $trimmed =~ [[:lower:]] ]]
}

main() {
  local trimmed
  trimmed="$(printf '%s' $*)"
  trimmed="${trimmed%%[[:space:]]*}"

  local len=${#trimmed}
  local lastchar=${trimmed:$len-1:1}

  if isEmpty; then echo 'Fine. Be that way!'
  elif isYellingQuestion; then echo "Calm down, I know what I'm doing!"
  elif isAsking; then echo 'Sure.'
  elif isYelling; then echo 'Whoa, chill out!'
  else echo 'Whatever.'
  fi
}

# call main with all of the positional arguments
main "$@"
