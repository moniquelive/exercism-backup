const std = @import("std");

const days: [12][]const u8 = .{
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
};

const gifts: [12][]const u8 = .{
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "a Partridge in a Pear Tree.",
};

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    for (start_verse - 1..end_verse) |i| {
        s.writer().print("On the {s} day of Christmas my true love gave to me: ", .{days[i]}) catch unreachable;
        for ((gifts.len - i - 1)..gifts.len) |j| {
            if (j > gifts.len - i - 1) {
                s.writer().writeAll(", ") catch unreachable;
                if (j == gifts.len - 1)
                    s.writer().writeAll("and ") catch unreachable;
            }
            s.writer().writeAll(gifts[j]) catch unreachable;
        }
        if (i < end_verse - 1)
            s.writer().writeAll("\n") catch unreachable;
    }
    return s.getWritten();
}
