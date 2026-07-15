module read_only_memory
(input [2:0]a,
output [7:0]y, [1:0]d
);

assign y[0] = ~a[2] & ~a[1] & ~a[0];
assign y[1] = ~a[2] & ~a[1] & a[0];
assign y[2] = ~a[2] & a[1] & ~a[0];
assign y[3] = ~a[2] & a[1] & a[0];
assign y[4] = a[2] & ~a[1] & ~a[0];
assign y[5] = a[2] & ~a[1] & a[0];
assign y[6] = a[2] & a[1] & ~a[0];
assign y[7] = a[2] & a[1] & a[0];

assign d[0] = y[1] | y[3] | y[5] | y[6];
assign d[1] = y[2] | y[3] | y[5] | y[6];


endmodule
 
