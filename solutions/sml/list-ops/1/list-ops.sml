(* Concatenates a list of lists into a single list *)
fun concat ([]: int list list) = []
  | concat (x::xs) = x @ concat(xs)

(* Reverses a list *)
fun reverse ([]: int list) = []
  | reverse (x::xs) = reverse(xs) @ [x]

(* Filters a list based on a predicate function *)
fun filter (f, []: int list) = []
  | filter (f, x::xs) = if f(x) then x :: filter(f, xs) else filter(f, xs)

(* Maps a function over a list, applying the function to each element *)
fun map (f, []: int list) = []
  | map (f, x::xs) = f(x) :: map(f, xs)

(* Appends two lists *)
fun append ([]: int list, list2: int list) = list2
  | append (x::xs, list2: int list) = x :: append(xs, list2)

(* Returns the length of a list *)
fun length ([]: int list) = 0
  | length (_::xs) = 1 + length(xs)

(* Left fold on a list *)
fun foldl (f, initial: int, []: int list) = initial
  | foldl (f, initial: int, x::xs) = foldl(f, f(initial, x), xs)

(* Right fold on a list *)
fun foldr (f, initial: int, []: int list) = initial
  | foldr (f, initial: int, x::xs) = f(x, foldr(f, initial, xs))
