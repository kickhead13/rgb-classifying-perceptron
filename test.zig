const std = @import("std");

pub fn testf(a: *f32, b: *[3]f32) void {
    a.* += 1;
    b[0] += 1;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var a: f32 = 1;
    var b: [3]f32 = .{ 1, 2, 3 };
    testf(&a, &b);
    try stdout.print("{} {}", .{ a, b[0] });
}
