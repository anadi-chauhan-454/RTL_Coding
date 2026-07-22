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

module async_ripple_counter_up
(input [3:0]T, CLK,
output [3:0]Q
);
    T_flip_flop tff0 (T[0], CLK,     Q[0]);
    T_flip_flop tff1 (T[1], Q[0],    Q[1]);
    T_flip_flop tff2 (T[2], Q[1],    Q[2]);
    T_flip_flop tff3 (T[3], Q[2],    Q[3]);
endmodule
