module AtbashCipher exposing (decode, encode)


rot26 : Char -> Char
rot26 c =
    if c >= 'a' && c <= 'z' then
        Char.toCode 'z'
            - (Char.toCode c - Char.toCode 'a')
            |> Char.fromCode

    else
        c


split : String -> String
split s =
    if String.length s < 5 then
        s

    else
        String.left 5 s ++ " " ++ split (String.dropLeft 5 s)


encode : String -> String
encode plain =
    String.toLower plain
        |> String.filter Char.isAlphaNum
        |> String.map rot26
        |> split
        |> String.trimRight


decode : String -> String
decode cipher =
    String.replace " " "" cipher
        |> String.map rot26
