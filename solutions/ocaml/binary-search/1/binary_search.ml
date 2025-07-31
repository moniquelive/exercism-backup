open Base

let find (array : Int.t array) (value : Int.t) : (Int.t, String.t) result =
  let rec go sub offset =
    if Array.length sub = 0 then
      Error "value not in array"
    else
      let h = Array.length sub / 2 in
      if sub.(h) < value then
        go (Array.sub sub (h + 1) (Array.length sub - h - 1)) (offset + h + 1)
      else if sub.(h) > value then
        go (Array.sub sub 0 h) offset
      else
        Ok (offset + h)
  in
  go array 0