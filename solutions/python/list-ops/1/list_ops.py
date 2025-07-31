def append(list1, list2):
    return list2 if not list1 else [list1[0]] + append(list1[1:], list2)

def concat(lists):
    return foldl(append, lists, [])

def length(list):
    return 0 if not list else 1 + length(list[1:])

def map(function, list):
    return [] if not list else [function(list[0])] + map(function, list[1:])

def foldl(function, list, initial):
    return initial if not list else foldl(function, list[1:], function(initial, list[0]))

def foldr(function, list, initial):
    return foldl(function, reverse(list), initial)

def reverse(list):
    return [] if not list else reverse(list[1:]) + [list[0]]

def filter(function, list):
    if not list:
        return []
    else:
        if function(list[0]):
            return [list[0]] + filter(function, list[1:])
        else:
            return filter(function, list[1:])
