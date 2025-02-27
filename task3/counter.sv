module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input   logic                clk,   // clock
    input   logic                rst,   // reset
    input   logic                en,    // counter enable
    input   logic [WIDTH-1:0]    val,   // 8 bit value for one shot mode
    output  logic [WIDTH-1:0]    count  // count output
);

always_ff @ (posedge clk)
    if (rst)    count <= {WIDTH{1'b0}};
    // else        count <= en ? val : count + {{WIDTH-1{1'b0}}, {1'b1}};
    else        count <= en ? count + {{WIDTH-1{1'b0}}, {1'b1}} : count;
endmodule
