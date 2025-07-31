pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  append_acc(reverse(first), second)
}

fn append_acc(lst: List(a), acc: List(a)) -> List(a) {
  case lst {
    [] -> acc
    [hd, ..tl] -> append_acc(tl, [hd, ..acc])
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(lists, [], append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  filter_acc(list, function, [])
}

fn filter_acc(list: List(a), function: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [] -> reverse(acc)
    [hd, ..tl] -> {
      case function(hd) {
        True -> filter_acc(tl, function, [hd, ..acc])
        False -> filter_acc(tl, function, acc)
      }
    }
  }
}

pub fn length(list: List(a)) -> Int {
  case list {
    [] -> 0
    [_, ..rest] -> 1 + length(rest)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  map_acc(list, function, [])
}

fn map_acc(list: List(a), function: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> reverse(acc)
    [hd, ..tl] -> map_acc(tl, function, [function(hd), ..acc])
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl_acc(list, initial, function, initial)
}

fn foldl_acc(
  list: List(a),
  initial: b,
  function: fn(b, a) -> b,
  acc : b,
) -> b {
  case list {
    [] -> acc
    [hd, ..tl] -> foldl_acc(tl, initial, function, function(acc, hd))
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl(reverse(list), initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
  reverse_acc(list, [])
}

fn reverse_acc(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [hd, ..rest] -> reverse_acc(rest, [hd, ..acc])
  }
}