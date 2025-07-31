pub fn clean(phrase: []const u8) ?[10]u8 {
    var ret: [10]u8 = undefined;
    const p = if (phrase[0] == '+' and phrase[1] == '1') phrase[2..] else if (phrase[0] == '1') phrase[1..] else phrase;
    var i: usize = 0;
    for (p) |c| {
        if (c < '0' or c > '9' or c == '.' or c == ' ' or c == '(' or c == ')' or c == '-') {
            continue;
        }
        if (i >= 10) {
            return null;
        }
        ret[i] = c;
        i += 1;
    }
    if (i < 10 or ret[0] == '0' or ret[0] == '1' or ret[3] == '0' or ret[3] == '1') return null;
    return ret;
}
