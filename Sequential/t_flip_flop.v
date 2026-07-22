module t_flip_flop
(input T,CLK,
output reg Q
);
always @(negedge CLK) begin	
	if(T)
	   Q <= ~Q;
	else
	   Q <= Q;
end
endmodule
