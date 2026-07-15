module vending_machine(
 input clk,
 input rst,
 input [1:0] in,       
 output reg out,
 output reg [1:0] change
);

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011,
          s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7 = 3'b111;

reg [2:0] cs, ns;

always @(posedge clk or posedge rst) begin
  if(rst)
    cs <= s0;
  else
    cs <= ns;
end

always @(*) begin
  ns = cs;
  out = 0;
  change = 2'b00;

  case(cs)

    s0: begin
      case(in)
        2'b00: ns = s0;
        2'b01: ns = s1;
        2'b10: ns = s2;
        2'b11: begin ns = s4; out = 1; end
      endcase
    end

    s1: begin
      case(in)
        2'b00: ns = s1;
        2'b01: ns = s2;
        2'b10: ns = s3;
        2'b11: ns = s5;
      endcase
    end

    s2: begin
      case(in)
        2'b00: ns = s2;
        2'b01: ns = s3;
        2'b10: begin ns = s4; out = 1; end
        2'b11: ns = s6;
      endcase
    end

    s3: begin
      case(in)
        2'b00: ns = s3;
        2'b01: begin ns = s4; out = 1; end
        2'b10: ns = s5;
        2'b11: ns = s7;
      endcase
    end

    s4: begin
      case(in)
        2'b00: ns = s4;
        2'b01: ns = s5;
        2'b10: ns = s6;
        2'b11: begin ns = s0; out = 1; end
      endcase
    end

    s5: begin
      case(in)
        2'b00: ns = s5;
        2'b01: ns = s6;
        2'b10: ns = s7;
        2'b11: begin ns = s0; out = 1; change = 2'b01; end
      endcase
    end

    s6: begin
      case(in)
        2'b00: ns = s6;
        2'b01: ns = s7;
        2'b10: begin ns = s0; out = 1; end
        2'b11: begin ns = s0; out = 1; change = 2'b10; end
      endcase
    end

    s7: begin
      case(in)
        2'b00: ns = s7;
        2'b01: begin ns = s0; out = 1; end
        2'b10: begin ns = s0; out = 1; change = 2'b01; end
        2'b11: begin ns = s0; out = 1; change = 2'b01; end
      endcase
    end

  endcase
end

endmodule

