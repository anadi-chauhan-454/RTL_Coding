module JK_flip_flop
(
    input j, k, clk,
    output reg q, qbar
);

wire [1:0] w;

assign w[0] = ~(j & clk & qbar);
assign w[1] = ~(k & clk & q);

always @(*) begin
    q     = ~(w[0] & qbar);
    qbar  = ~(w[1] & q);
end

initial begin
    q = 0;
    qbar = 1;
end

endmodule
