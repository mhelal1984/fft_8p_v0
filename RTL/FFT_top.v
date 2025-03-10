/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 9th, 2025
	description		:	FFT top module
	version			:	0.0
*/
module FFT_top (
input	wire 			clk,reset_n,
input	wire			start,
input	wire 	[15:0]	s_in,	// from ROM to FFT_datapath
output	wire 			s2p_en,
output	wire[15:0]		X_0_re,X_1_re,
						X_4_re,X_5_re,
						X_0_im,X_1_im,
						X_4_im,X_5_im,
						X_2_re,X_3_re,
						X_6_re,X_7_re,
						X_2_im,X_3_im,
						X_6_im,X_7_im			

);
//internal signals
wire		en_s2p,
			en_bf1_1,en_bf1_2,en_bf1_3,	
			en_bf1_4,en_bf2_1,en_bf2_2,en_bf3;

FFT_datapath DP (
	.clk		(clk	),
	.reset_n	(reset_n),
	//serial input
	.s_in(s_in),	
	
	//enable signals dp < control
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
FFT_8p_control_2 ctrl (
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

assign s2p_en = en_s2p;

endmodule