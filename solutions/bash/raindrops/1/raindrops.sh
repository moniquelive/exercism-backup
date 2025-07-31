#!/usr/bin/env bash

main () {
  local ret=""
  if (( $1 % 3 == 0 )); then
    ret="Pling"
  fi
  if (( $1 % 5 == 0 )); then
    ret+="Plang"
  fi
  if (( $1 % 7 == 0 )); then
    ret+="Plong"
  fi
  if [[ -z $ret ]]; then
    echo $1
    return
  fi
  echo $ret
}

main "$@"
