const fmt = @import("std").fmt;

pub fn convert(buffer: []u8, n: u32) []const u8 {
    const result = fmt.bufPrint(buffer, "{s}{s}{s}", .{
        if (n % 3 == 0) "Pling" else "",
        if (n % 5 == 0) "Plang" else "",
        if (n % 7 == 0) "Plong" else "",
    }) catch "";

    return if (result.len > 0)
        result
    else
        fmt.bufPrint(buffer, "{d}", .{n}) catch "";
}
