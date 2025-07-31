#!/usr/bin/env bash

main () {
  local ret

  for w in ${1//[-_*]/ }; do
    ret+=${w:0:1}
  done

  echo ${ret^^}
}

main "$@"
