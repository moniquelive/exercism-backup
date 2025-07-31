module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    let
        fn c n =
            case c of
                'A' ->
                    { n | a = n.a + 1 }

                'C' ->
                    { n | c = n.c + 1 }

                'G' ->
                    { n | g = n.g + 1 }

                'T' ->
                    { n | t = n.t + 1 }

                _ ->
                    Debug.todo <| "unexpected nucleotide " ++ String.fromChar c
    in
    String.foldl fn (NucleotideCounts 0 0 0 0) sequence
