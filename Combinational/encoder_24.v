module encoder_24

(input [7:0]a,
output [2:0]b
);

assign b[0] = a[1] | a[3] | a[5] | a[7];
assign b[1] = a[2] | a[3] | a[6] | a[7];
assign b[2] = a[4] | a[5] | a[6] | a[7];

endmodule
