////////////////////////////////////////////////////////////////////////////////
//
// By : Joshua, Teresia Savera, Yashael Faith
// 
// Module Name      : Hidden Layer Module
// File Name        : hidden.v
// Version          : 1.0
// Description      : hidden layer, each perceptron have:
//                    NUM_INPUT inputs and weights
//
////////////////////////////////////////////////////////////////////////////////

module hidden(clk, rst, wr, i_k, i_w, i_b, o_a, o_w, o_b);

// parameters
parameter NUM_INPUT = 2;
parameter NUM_PCTN = 3;
parameter WIDTH = 32;

// common ports
input clk, rst;

// control ports
input wr;

// input ports
input signed [NUM_INPUT*WIDTH-1:0] i_k;
input signed [NUM_INPUT*WIDTH-1:0] i_w;
input signed [WIDTH-1:0] i_b;

// output ports
output signed [NUM_PCTN*WIDTH-1:0] o_a;
output signed [NUM_PCTN*NUM_INPUT*WIDTH-1:0] o_w;
output signed [NUM_PCTN*WIDTH-1:0] o_b;

// wires
wire signed [WIDTH-1:0] o_1;
wire signed [WIDTH-1:0] o_2;
wire signed [WIDTH-1:0] o_3;
wire signed [NUM_INPUT*WIDTH-1:0] w_1;
wire signed [NUM_INPUT*WIDTH-1:0] w_2;
wire signed [NUM_INPUT*WIDTH-1:0] w_3;
wire signed [WIDTH-1:0] b_1;
wire signed [WIDTH-1:0] b_2;
wire signed [WIDTH-1:0] b_3;

// instantiating a NUM_PCTN of perceptrons
/*perceptron #(.NUM(NUM_INPUT), .WIDTH(WIDTH)) pctn[NUM_PCTN-1:0] (
	.clk(clk),
	.rst(rst),
	.wr(wr),
	.i_k(i_k),
	.i_w(i_w),
	.i_b(i_b),
	.o(o)
);
*/

perceptron #(
		.NUM(NUM_INPUT),
		.WIDTH(WIDTH),
		.FILE_NAME("mem_wght1.list")
	) perceptron_1 (
		.clk (clk),
		.rst (rst),
		.wr  (wr),
		.i_k (i_k),
		.i_w (i_w),
		.i_b (i_b),
		.o_a (o_1),
		.o_w (w_1),
		.o_b (b_1)
	);

perceptron #(
		.NUM(NUM_INPUT),
		.WIDTH(WIDTH),
		.FILE_NAME("mem_wght2.list")
	) perceptron_2 (
		.clk (clk),
		.rst (rst),
		.wr  (wr),
		.i_k (i_k),
		.i_w (i_w),
		.i_b (i_b),
		.o_a (o_2),
		.o_w (w_2),
		.o_b (b_2)
	);

perceptron #(
		.NUM(NUM_INPUT),
		.WIDTH(WIDTH),
		.FILE_NAME("mem_wght3.list")
	) perceptron_3 (
		.clk (clk),
		.rst (rst),
		.wr  (wr),
		.i_k (i_k),
		.i_w (i_w),
		.i_b (i_b),
		.o_a (o_3),
		.o_w (w_3),
		.o_b (b_3)
	);

assign o_a= {o_3, o_2, o_1};
assign o_w= {w_3, w_2, w_1};
assign o_b= {b_3, b_2, b_1};

endmodule