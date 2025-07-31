module ListOps exposing
    ( append
    , concat
    , filter
    , foldl
    , foldr
    , length
    , map
    , reverse
    )


length : List a -> Int
length list =
    let
        count _ acc =
            acc + 1
    in
    foldl count 0 list


reverse : List a -> List a
reverse list =
    let
        rev e acc =
            e :: acc
    in
    foldl rev [] list


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
        [] ->
            acc

        l :: ls ->
            foldl f (f l acc) ls


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    foldl f acc (reverse list)


map : (a -> b) -> List a -> List b
map f list =
    let
        m e acc =
            acc ++ [ f e ]
    in
    foldl m [] list


filter : (a -> Bool) -> List a -> List a
filter f list =
    let
        filt e acc =
            if f e then
                acc ++ [ e ]

            else
                acc
    in
    foldl filt [] list


append : List a -> List a -> List a
append xs ys =
    let
        appnd e a =
            a ++ [ e ]
    in
    foldl appnd xs ys


concat : List (List a) -> List a
concat list =
    let
        conc l a =
            a ++ l
    in
    foldl conc [] list
