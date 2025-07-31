const io = @import("std").io;

pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    var stream = io.fixedBufferStream(buffer);
    try stream.writer().print("One for {s}, one for me.", .{name orelse "you"});
    return stream.buffer[0..stream.pos];
}
