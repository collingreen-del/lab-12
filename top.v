module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    wire z_onehot;
    wire oh_A, oh_B, oh_C, oh_D, oh_E;
 
    onehot oh_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_onehot),
        .Astate(oh_A),
        .Bstate(oh_B),
        .Cstate(oh_C),
        .Dstate(oh_D),
        .Estate(oh_E)
    );
 
    // Binary state machine outputs
    wire z_binary;
    wire [2:0] bin_state;
 
    binary bin_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .State(bin_state)
    );
 
    // IO Table pin assignments:
    // led[0]   = One-hot Z
    // led[1]   = Binary Z
    // led[2]   = One-hot state A
    // led[3]   = One-hot state B
    // led[4]   = One-hot state C
    // led[5]   = One-hot state D
    // led[6]   = One-hot state E
    // led[9:7] = Binary State [2:0]
    assign led[0]   = z_onehot;
    assign led[1]   = z_binary;
    assign led[2]   = oh_A;
    assign led[3]   = oh_B;
    assign led[4]   = oh_C;
    assign led[5]   = oh_D;
    assign led[6]   = oh_E;
    assign led[9:7] = bin_state;
 
endmodule

endmodule
