parameter width = 4;

module comparator(
    input [width-1:0] a,
    input [width-1:0] b,
    output reg neq,
    output reg eq,
    output reg gr,
    output reg greq,
    output reg ls,
    output reg lseq
    );
   
always@(*)
begin
    if (a == b)
    begin
        eq = 1'b1;      neq = 1'b0;
        greq = 1'b1;    gr = 1'b0;
        lseq = 1'b1;    ls = 1'b0;
    end
    
    else if (a > b)
    begin
        greq = 1'b1;    lseq = 1'b0;
        gr = 1'b1;      ls = 1'b0;
        neq = 1'b1;     eq = 1'b0;
    end
    
    else if (a < b)
    begin
        lseq = 1'b1;    greq = 1'b0;
        ls = 1'b1;      gr = 1'b0;
        neq = 1'b1;     eq = 1'b0;
    end
    
    else begin
        lseq = 1'b0;    greq = 1'b0;
        ls = 1'b0;      gr = 1'b0;
        neq = 1'b0;     eq = 1'b0;
    end 
end

endmodule
