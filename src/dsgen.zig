const std = @import("std");
const dstruct = @import("struct.zig");
const conv = @import("activation.zig");

pub fn main() !void {
    @setEvalBranchQuota(2000);

    const stdout = std.io.getStdOut().writer();
    var data = dstruct.Data.new();
    var iterator: u32 = 0;

    try stdout.print("{{", .{});
    while (iterator < 10000) : (iterator += 1) {
        try stdout.print(".{{ {d}, {d}, {d}, {s} }},\n ", .{ conv.convert(data.r), conv.convert(data.g), conv.convert(data.b), data.label.format() });
        data = dstruct.Data.new();
    }
    try stdout.print("}}\n", .{});
}
