const std = @import("std");

pub fn convert(x: u32) f32 {
    return @as(f32, @floatFromInt(x));
}

pub fn sigmoid(x: f32) f32 {
    return 1 / (1 + std.math.pow(f32, @as(f32, 2.71828), -x));
}

pub fn dsigmoid(x: f32) f32 {
    return sigmoid(x) * (1 - sigmoid(x));
}

pub fn relu(x: f32) f32 {
    if (x > 0) return x;
    return 0;
}

pub fn lrelu(x: f32) f32 {
    if (0.1 * x < x) return x;
    return 0.1 * x;
}
