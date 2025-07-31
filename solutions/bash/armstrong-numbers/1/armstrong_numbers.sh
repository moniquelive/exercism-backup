#!/usr/bin/env bash

main () {
  local sum
  for (( i=0; i<${#1}; i++ )); do
    (( sum += ${1:$i:1} ** ${#1} ))
  done
  [ $sum -eq $1 ] && echo true || echo false
}

main "$@"
exit 0
