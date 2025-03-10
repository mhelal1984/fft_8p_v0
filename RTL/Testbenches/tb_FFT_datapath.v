/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 9th, 2025
	description		:	testbench for 8-point FFT datapath
	version			:	0.0
*/
module tb_FFT_datapath();

//test parameters
parameter HALF_CLK = 5;
parameter CLK_PERIOD = 2*HALF_CLK;
parameter RST_PERIODE = 2;

//test signals
reg [5:0] index ;		// reading address to the ROM
reg			clk,reset_n,start;
wire		en_s2p,
			en_bf1_1,en_bf1_2,en_bf1_3,	
			en_bf1_4,en_bf2_1,en_bf2_2,en_bf3;	

wire [15:0]	s_in;	// from ROM to FFT_datapath

wire[15:0]	X_0_re,X_1_re,
            X_4_re,X_5_re,
            X_0_im,X_1_im,
            X_4_im,X_5_im,
            X_2_re,X_3_re,
            X_6_re,X_7_re,
            X_2_im,X_3_im,
            X_6_im,X_7_im;			

//DUT instantiation
FFT_datapath DUT (
	.clk		(clk	),
	.reset_n	(reset_n),
	//serial input
	.s_in(s_in),	
	
	//enable signals
	.en_s2p		(en_s2p),
	.en_bf1_1	(en_bf1_1), .en_bf1_2	(en_bf1_2),
	.en_bf1_3	(en_bf1_3), .en_bf1_4	(en_bf1_4),
	.en_bf2_1	(en_bf2_1), .en_bf2_2	(en_bf2_2),
	.en_bf3		(en_bf3	),
	//outputs
	.X_0_re(X_0_re),.X_1_re(X_1_re),
	.X_4_re(X_4_re),.X_5_re(X_5_re),
	.X_0_im(X_0_im),.X_1_im(X_1_im),
	.X_4_im(X_4_im),.X_5_im(X_5_im),
	.X_2_re(X_2_re),.X_3_re(X_3_re),
	.X_6_re(X_6_re),.X_7_re(X_7_re),
	.X_2_im(X_2_im),.X_3_im(X_3_im),
	.X_6_im(X_6_im),.X_7_im(X_7_im)
);

//ROM containning test vectors coming out orderdred for FFT
FFT_xn_ROM ROM (
	.clk	(clk),
	.addr	(index),
	.dout	(s_in)
);
//FSM
FFT_8p_control FSM (
.clk	 	(clk	 ),
.reset_n	(reset_n),
.start		(start),
.en_s2p		(en_s2p	),
.en_bf1_1	(en_bf1_1),
.en_bf1_2	(en_bf1_2),
.en_bf1_3	(en_bf1_3),
.en_bf1_4	(en_bf1_4),
.en_bf2_1	(en_bf2_1),
.en_bf2_2	(en_bf2_2),
.en_bf3     (en_bf3)
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
	#(12*CLK_PERIOD);
	start = 1;
	#CLK_PERIOD
	start = 0;
	#(12*CLK_PERIOD);
	#(10*CLK_PERIOD)		//waiting to finish all the test vector
	$stop;
end

//index generator
always@(posedge clk) index = (en_s2p)? index + 1'b1 : index;


//clock generator
always#HALF_CLK clk = ~clk;


endmodule