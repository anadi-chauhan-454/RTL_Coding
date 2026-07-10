module muux8_2(
  input logic[1:0] data_in[7:0],
  input logic[2:0] select_line,
  output logic[1:0] data_out
);
  
  always_comb begin
    case(select_line)
      3'b000 : data_out = data_in[0];
      3'b001 : data_out = data_in[1];
      3'b010 : data_out = data_in[2];
      3'b011 : data_out = data_in[3];
      3'b100 : data_out = data_in[4];
      3'b101 : data_out = data_in[5];
      3'b110 : data_out = data_in[6];
      3'b111 : data_out = data_in[7];
      
      default: data_out = 2'b00;
      
    endcase
  end
endmodule
