module onehot(
    input  w,
    input  clk,
    input  reset,
    output z,
    output Ast,
    output Bst,
    output Cst,
    output Dst,
    output Est
);
    wire An, Bn, Cn, Dn, En;
 
    
    dff Adff(.Default(1'b1), .D(An), .clk(clk), .reset(reset), .Q(Ast));
    dff Bdff(.Default(1'b0), .D(Bn), .clk(clk), .reset(reset), .Q(Bst));
    dff Cdff(.Default(1'b0), .D(Cn), .clk(clk), .reset(reset), .Q(Cst));
    dff Ddff(.Default(1'b0), .D(Dn), .clk(clk), .reset(reset), .Q(Dst));
    dff Edff(.Default(1'b0), .D(En), .clk(clk), .reset(reset), .Q(Est));


    assign z = Cst | Est;
 
   
    assign An = 1'b0;
    assign Bn = ~w & (Ast | Dst | Est);
    assign Cn = ~w & (Bst | Cst);
    assign Dn =  w & (Ast | Bst | Cst);
    assign En =  w & (Dst | Est);
 
endmodule
