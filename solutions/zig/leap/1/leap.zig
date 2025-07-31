pub fn isLeapYear(year: u32) bool {
    const by400 = (year % 400) == 0;
    const by4 = (year % 4) == 0;
    const by100 = (year % 100) == 0;
    return by400 or (by4 and !by100);
}
