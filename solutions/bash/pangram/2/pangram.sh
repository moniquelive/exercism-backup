main () {
  local lower=${1,,}
  local alpha=${lower//[^a-z]/}

  declare -A letters
  for (( i=0; i<${#alpha}; i++ )); do
    letters[${alpha:$i:1}]=1
  done
  (( ${#letters[@]} == 26 )) && echo "true" || echo "false"
}

main "$@"
