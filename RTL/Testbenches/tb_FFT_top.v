/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 9th, 2025
	description		:	testbench for 8-point FFT 
	version			:	0.0
*/
module tb_FFT_top();

//test parameters
parameter HALF_CLK = 5;
parameter CLK_PERIOD = 2*HALF_CLK;
parameter RST_PERIODE = 2;

//test signals
reg [5:0] 	index ;		// reading address to the ROM
reg			clk,reset_n,start;

wire [15:0]	s_in;		//from ROM 

wire loading;	//just to drive the index counter

wire[15:0]	X_0_re,X_1_re,
            X_4_re,X_5_re,
            X_0_im,X_1_im,
            X_4_im,X_5_im,
            X_2_re,X_3_re,
            X_6_re,X_7_re,
            X_2_im,X_3_im,
            X_6_im,X_7_im;			

//DUT instantiation
FFT_top DUT (
	.clk		(clk	),
	.reset_n	(reset_n),
	//start controller FSM
	.start(start),	
	//serial input from ROM
	.s_in(s_in),
	//outputs
	.X_0_re(X_0_re),.X_1_re(X_1_re),
	.X_4_re(X_4_re),.X_5_re(X_5_re),
	.X_0_im(X_0_im),.X_1_im(X_1_im),
	.X_4_im(X_4_im),.X_5_im(X_5_im),
	.X_2_re(X_2_re),.X_3_re(X_3_re),
	.X_6_re(X_6_re),.X_7_re(X_7_re),
	.X_2_im(X_2_im),.X_3_im(X_3_im),
	.X_6_im(X_6_im),.X_7_im(X_7_im),
	.s2p_en(loading)
);

// ROM containning test vectors coming orderdred for FFT
// the file is generated via octave 
// (code included in ../octave_scripts)
FFT_xn_ROM ROM (
	.clk	(clk),
	.addr	(index),
	.dout	(s_in)
);

//test driver
initial begin
	clk = 0;
	reset_n = 0;
	index = 0;
	start = 0;
	
	#RST_PERIODE
	reset_n = 1;
	#(CLK_PERIOD - RST_PERIODE)
	
	start = 1;
	#CLK_PERIOD
	start = 0;
	#(11*CLK_PERIOD);	//first round latency
	#(5*8*CLK_PERIOD);	//work for 5 rounds after that
	start = 1;
	#CLK_PERIOD			//toggle to pause the operation
	start = 0;
	#(20*CLK_PERIOD)
	$stop;
end

//index generator
always@(posedge clk) index = (loading)? index + 1'b1 : index;


//clock generator
always#HALF_CLK clk = ~clk;


endmodule