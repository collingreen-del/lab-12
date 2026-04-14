module binary(
    input  w,
    input  clk,
    input  reset,
    output z,
    output [2:0] State
);
    wire [2:0] Next;
 
    // State encoding: A=000, B=001, C=010, D=011, E=100
    // State[2]=z_bit (MSB), State[1]=y_bit, State[0]=x_bit (LSB)
    // Reset to A=000: all Default=0
    dff bit0(.Default(1'b0), .D(Next[0]), .clk(clk), .reset(reset), .Q(State[0]));
    dff bit1(.Default(1'b0), .D(Next[1]), .clk(clk), .reset(reset), .Q(State[1]));
    dff bit2(.Default(1'b0), .D(Next[2]), .clk(clk), .reset(reset), .Q(State[2]));
 
    // Output: z=1 in state C (010) or E (100)
    assign z = State[2] | (State[1] & ~State[0]);
 
    // Next-state logic (KMap-minimized, variables: z=State[2], y=State[1], x=State[0], w)
    //
    // X_next (LSB) = ~z&~y&~x | ~z&~y&w | y&~x&w | y&x&~w | z&~y&~w
    // Y_next (mid) = ~z & (~x&(y|w) | ~y&x)
    // Z_next (MSB) = w&~z&y&x | w&z&~y&~x
 
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
