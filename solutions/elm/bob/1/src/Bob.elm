module Bob exposing (hey)

hey : String -> String
hey remark =
    let trimmed = String.trim remark
    in if silence trimmed  then "Fine. Be that way!"
        else if calmDown trimmed then "Calm down, I know what I'm doing!"
        else if question trimmed then "Sure."
        else if yell trimmed then "Whoa, chill out!"
        else "Whatever."

anyAlpha        = String.any Char.isAlpha
question        = String.endsWith "?"
silence         = String.isEmpty
calmDown remark = question remark && yell remark
yell     remark = anyAlpha remark && String.toUpper remark == remark

