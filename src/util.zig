const activation = @import("activation.zig");

pub fn forwardPropagation(r: f32, g: f32, b: f32, v: *[9]f32, w: *[9]f32, b1: f32, b2: f32, output1: *[3]f32, output2: *[3]f32) void {
    output1[0] = activation.sigmoid(b1 + r * v[0] + g * v[3] + b * v[6]);
    output1[1] = activation.sigmoid(b1 + r * v[1] + g * v[4] + b * v[7]);
    output1[2] = activation.sigmoid(b1 + r * v[2] + g * v[5] + b * v[8]);

    output2[0] = activation.sigmoid(b2 + output1[0] * w[0] + output1[1] * w[3] + output1[2] * w[6]);
    output2[1] = activation.sigmoid(b2 + output1[0] * w[1] + output1[1] * w[4] + output1[2] * w[7]);
    output2[2] = activation.sigmoid(b2 + output1[0] * w[2] + output1[1] * w[5] + output1[2] * w[8]);
}

pub fn backwardPropagation(alfa: f32, etotal: f32, v: *[9]f32, w: *[9]f32, b1: *f32, b2: *f32, output1: [3]f32, output2: [3]f32, target: [3]f32, input: [3]f32) void {
    _ = b1;
    _ = etotal;
    _ = b2;

    w[0] = w[0] - alfa * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * output1[0]);
    w[1] = w[1] - alfa * ((output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * output1[0]);
    w[2] = w[2] - alfa * ((output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * output1[0]);
    w[3] = w[3] - alfa * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * output1[1]);
    w[4] = w[4] - alfa * ((output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * output1[1]);
    w[5] = w[5] - alfa * ((output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * output1[1]);
    w[6] = w[6] - alfa * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * output1[2]);
    w[7] = w[7] - alfa * ((output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * output1[2]);
    w[8] = w[8] - alfa * ((output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * output1[2]);

    v[0] = v[0] - alfa * (output1[0] * (1 - output1[0])) * input[0] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[0] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[1] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[2]);

    v[1] = v[1] - alfa * (output1[1] * (1 - output1[1])) * input[0] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[3] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[4] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[5]);

    v[2] = v[2] - alfa * (output1[2] * (1 - output1[2])) * input[0] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[6] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[7] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[8]);

    v[3] = v[3] - alfa * (output1[0] * (1 - output1[0])) * input[1] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[0] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[1] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[2]);

    v[4] = v[4] - alfa * (output1[1] * (1 - output1[1])) * input[1] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[3] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[4] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[5]);

    v[5] = v[5] - alfa * (output1[2] * (1 - output1[2])) * input[1] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[6] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[7] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[8]);

    v[6] = v[6] - alfa * (output1[0] * (1 - output1[0])) * input[2] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[0] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[1] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[2]);

    v[7] = v[7] - alfa * (output1[1] * (1 - output1[1])) * input[2] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[3] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[4] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[5]);

    v[8] = v[8] - alfa * (output1[2] * (1 - output1[2])) * input[2] * ((output2[0] - target[0]) * (output2[0] * (1 - output2[0])) * w[6] + (output2[1] - target[1]) * (output2[1] * (1 - output2[1])) * w[7] + (output2[2] - target[2]) * (output2[2] * (1 - output2[2])) * w[8]);

    //b2.* = b2.* - alfa * etotal;
    //b1.* = b1.* - alfa * etotal;
}
