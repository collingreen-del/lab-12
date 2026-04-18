module top(
    input sw, 
    output [9:0] led, 
    input btnC, 
    input btnU 
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
 
    wire z_binary;
    wire [2:0] bin_state;
 
    binary bin_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .State(bin_state)
    );
 
    
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
