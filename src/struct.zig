const std = @import("std");

pub const Label = enum {
    red,
    green,
    blue,

    pub fn format(label: Label) *const [1:0]u8 {
        if (label == Label.red) return "0";
        if (label == Label.green) return "1";
        return "2";
    }
};

fn setLabel(num: u32) Label {
    var ret = Label.red;
    var max = num >> 24;
    if (((num << 8) >> 24) > (num >> 24)) {
        ret = Label.green;
        max = ((num << 8) >> 24);
    }
    if (((num << 16) >> 24) > max) {
        ret = Label.blue;
    }
    return ret;
}

pub const Data = struct {
    r: u32,
    g: u32,
    b: u32,
    label: Label,

    pub fn new() Data {
        const num = std.crypto.random.int(u32);
        return Data{
            .r = num >> 24,
            .g = (num << 8) >> 24,
            .b = (num << 16) >> 24,
            .label = setLabel(num),
        };
    }
};
