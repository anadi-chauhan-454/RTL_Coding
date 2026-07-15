module sr_flip_flop

(
input s, r, clk,
output q, qbar
);

wire [1:0]w;

nand n1(w[0], s, clk);
nand n2(w[1], r, clk);

nand n3(q, w[0], qbar);
nand n4(qbar, w[1], q);

endmodule
