#!/usr/bin/env bash

# Disable globbing
set -f

# Function to check rules and convert phrase
rules() {
  local phrase="$1"
  local p2="${phrase:0:2}"
  
  if [[ "$phrase" =~ ^[aeiou] || "$p2" == "xr" || "$p2" == "yt" || "$p2" == "ay" ]]; then
    echo "${phrase}ay"
  elif [[ "$phrase" =~ ^([bcdfghjklmnpqrstvwxyz]*qu) ]]; then
    local r3="${BASH_REMATCH[1]}"
    echo "${phrase:${#r3}}${r3}ay"
  elif [[ "$phrase" =~ ^([bcdfghjklmnpqrstvwxyz]+)y ]]; then
    local r4="${BASH_REMATCH[1]}"
    echo "${phrase:${#r4}}${r4}ay"
  elif [[ "$phrase" =~ ^([bcdfghjklmnpqrstvwxyz]+) ]]; then
    local r2="${BASH_REMATCH[1]}"
    echo "${phrase:${#r2}}${r2}ay"
  else
    echo "$phrase"
  fi
}

# Main function to process input
main() {
  local phrase="$*"
  local result=""
  for word in $phrase; do
    result+=$(rules "$word")" "
  done
  echo "${result% }"
}

# Call main with all positional arguments
main "$@"