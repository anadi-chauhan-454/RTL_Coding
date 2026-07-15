module traffic_light_controller
(
    input clk,
    input rst,
    output reg [1:0] road1,
    output reg [1:0] road2,
    output reg [1:0] road3,
    output reg [1:0] road4
);

parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

reg [1:0] state;
reg [2:0] timer;  

always @(posedge clk) begin
    if (rst) begin
        state <= S0;
        timer <= 0;
    end 
    else begin
        if (timer == 4) begin
            state <= state + 1;
            timer <= 0;
        end 
        else begin
            timer <= timer + 1;
        end

        case(state)
            S0: begin
                road1 <= GREEN;
                road2 <= RED;
                road3 <= RED;
                road4 <= YELLOW;
            end

            S1: begin
                road1 <= YELLOW;
                road2 <= GREEN;
                road3 <= RED;
                road4 <= RED;
            end

            S2: begin
                road1 <= RED;
                road2 <= YELLOW;
                road3 <= GREEN;
                road4 <= RED;
            end

            S3: begin
                road1 <= RED;
                road2 <= RED;
                road3 <= YELLOW;
                road4 <= GREEN;
            end
        endcase
    end
end

endmodule

