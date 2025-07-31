# Search an array for a value and return the index.
#
# + array - a sorted array of integers
# + value - the integer item to find
# + return - the index of the value, or nil if the value is not found

public function find(int[] array, int value) returns int? {
    return go(array, value, 0);
}

function go(int[] sub, int value, int offset) returns int? {
    if (sub.length() == 0) {
        return ();
    }

    int h = sub.length() / 2;
    if (sub[h] < value) {
        return go(sub.slice(h + 1), value, offset + h + 1);
    } else if (sub[h] > value) {
        return go(sub.slice(0, h), value, offset);
    } else {
        return offset + h;
    }
}