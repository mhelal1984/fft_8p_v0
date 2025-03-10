/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 8th, 2025
	description		:	testbench for Butterfly block stage I: computes first stage result(x0,x4..x1,x5...etc)
	version			:	0.0
*/
module tb_bf1();

//test signals
reg					clk,reset_n;
reg		[15:0]		x_0_re,x_1_re;
wire	[15:0]		g_0_re,
					g_1_re;

//test parameters
parameter HALF_CLK = 5;
parameter CLK_PERIOD = 2*HALF_CLK;
parameter RST_PERIODE = 2;

BF1 DUT (
.clk	(clk	),
.reset_n(reset_n),
.x_0_re	(x_0_re	),
.x_1_re	(x_1_re	),
.g_0_re	(g_0_re	),
.g_1_re	(g_1_re	)
);

//test sequence
initial begin
	clk = 0;
	reset_n = 0;
	x_0_re = 0;
	x_1_re = 0;
	
	#RST_PERIODE
	reset_n = 1;
	
	x_0_re = 16'b0000_000110011001;	//   0.1
	x_1_re = 16'b1111_110011001101;	// - 0.2
	
	#(CLK_PERIOD - RST_PERIODE)
	
	x_0_re = 16'b0000_010011001100;	//   0.3
	x_0_re = 16'b1111_101100110100;	// - 0.3
	
	#CLK_PERIOD
	$stop;
	
end

//test monitor
initial
begin
	$monitor("Time=%0t | X0_re=%b		\n X1_re=%b", 
             $time, 	 g_0_re,     	g_1_re);
end    



//clock generator
always #(HALF_CLK)	clk = ~clk;

endmodule