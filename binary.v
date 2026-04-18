module binary(
    input  w,
    input  clk,
    input  reset,
    output z,
    output [2:0] State
);
    wire [2:0] Next;
 
   
    dff bit0(.Default(1'b0), .D(Next[0]), .clk(clk), .reset(reset), .Q(State[0]));
    dff bit1(.Default(1'b0), .D(Next[1]), .clk(clk), .reset(reset), .Q(State[1]));
    dff bit2(.Default(1'b0), .D(Next[2]), .clk(clk), .reset(reset), .Q(State[2]));
 
    assign z = State[2] | (State[1] & ~State[0]);
 
   
    wire zb, y, x;
    assign zb = State[2];
    assign y = State[1];
    assign x = State[0];
 
    assign Next[0] = (~zb & ~y & ~x)
                   | (~zb & ~y &  w  )
                   | ( y & ~x &  w  )
                   | ( y &  x & ~w  )
                   | ( zb & ~y & ~w  );
 
    assign Next[1] = ~zb & ((~x & (y | w)) | (~y & x));
 
    assign Next[2] = (w & ~zb & y & x)
                   | (w &  zb & ~y & ~x);
 
endmodule
