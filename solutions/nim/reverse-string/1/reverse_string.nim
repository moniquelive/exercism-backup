import strutils

proc reverse*(s: string): string =
  var reversedString = ""
  for ch in s:
      reversedString = ch & reversedString
  reversedString