const activation = @import("activation.zig");

pub fn forwardPropagation(r: f32, g: f32, b: f32, v: *[9]f32, w: *[9]f32, b1: f32, b2: f32, output1: *[3]f32, output2: *[3]f32) void {
    output1[0] = activation.sigmoid(b1 + r * v[0] + g * v[3] + b * v[6]);
    output1[1] = activation.sigmoid(b1 + r * v[1] + g * v[4] + b * v[7]);
    output1[2] = activation.sigmoid(b1 + r * v[2] + g * v[5] + b * v[8]);

    output2[0] = activation.sigmoid(b2 + output1[0] * w[0] + output1[1] * w[3] + output1[2] * w[6]);
    output2[1] = activation.sigmoid(b2 + output1[0] * w[1] + output1[1] * w[4] + output1[2] * w[7]);
    output2[2] = activation.sigmoid(b2 + output1[0] * w[2] + output1[1] * w[5] + output1[2] * w[8]);
}
