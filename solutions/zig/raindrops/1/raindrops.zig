const fmt = @import("std").fmt;

pub fn convert(buffer: []u8, n: u32) []const u8 {
    if (n % 3 == 0 and n % 5 == 0 and n % 7 == 0) return "PlingPlangPlong";
    if (n % 3 == 0 and n % 5 == 0) return "PlingPlang";
    if (n % 3 == 0 and n % 7 == 0) return "PlingPlong";
    if (n % 5 == 0 and n % 7 == 0) return "PlangPlong";
    if (n % 3 == 0) return "Pling";
    if (n % 5 == 0) return "Plang";
    if (n % 7 == 0) return "Plong";
    const c = fmt.bufPrint(buffer, "{d}", .{n}) catch "";
    return buffer[0..c.len];
}
