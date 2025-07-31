module RNATranscription exposing (toRNA)


toMaybeList : List (Maybe a) -> Maybe (List a)
toMaybeList =
    List.foldl (Maybe.map2 (::)) (Just [])


rna_map : Char -> List (Maybe Char) -> List (Maybe Char)
rna_map n a =
    let
        rna =
            case n of
                'G' ->
                    Just 'C'

                'C' ->
                    Just 'G'

                'T' ->
                    Just 'A'

                'A' ->
                    Just 'U'

                _ ->
                    Nothing
    in
    rna :: a


toRNA : String -> Result String String
toRNA dna =
    let
        mapped =
            List.foldl rna_map [] (String.toList dna)
    in
    case toMaybeList mapped of
        Nothing ->
            Err "fuuuu"

        Just lst ->
            Ok (String.fromList lst)
