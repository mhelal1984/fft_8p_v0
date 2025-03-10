/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 9th, 2025
	description		:	8-point FFT datapath, S2p >> FFT_3stage
	version			:	0.0
*/

module FFT_datapath (
//global clock and reset
input	wire			clk,reset_n,
input	wire	[15:0]	s_in,
//enable signals
input	wire			en_s2p,			//s2p
input	wire			en_bf1_1,en_bf1_2,en_bf1_3,			//FFT_3stage
						en_bf1_4,en_bf2_1,en_bf2_2,en_bf3,  //FFT_3stage

//FFT output (FFT_3stage)
output	wire	[15:0]	X_0_re,X_1_re,
						X_4_re,X_5_re,
						X_0_im,X_1_im,
						X_4_im,X_5_im,
						X_2_re,X_3_re,
						X_6_re,X_7_re,
						X_2_im,X_3_im,
						X_6_im,X_7_im
);

//internal signals
	//serial to parallel register signals (s2p to FFT_3stage)
	wire	[15:0]	x0,x1,x2,x3,
					x4,x5,x6,x7;

//module instantiation
//serial to parallel register
// note: should be filled in that order (0>4>2>6>1>5>3>7)
// this will be resolved by the way ROM is addressed
// addr = {index[5:3],index[0],index[1],index[2]}
s2p DUT (
.clk	(clk),
.reset_n(reset_n),
.en		(en_s2p),
.s_in	(s_in),
.p_out0	(x0),
.p_out1	(x1),
.p_out2	(x2),
.p_out3	(x3),
.p_out4	(x4),
.p_out5	(x5),
.p_out6	(x6),
.p_out7 (x7)
);


FFT_3stage FFT_stages (
.clk		(clk),
.reset_n	(reset_n),
.en_bf1_1	(en_bf1_1),
.en_bf1_2	(en_bf1_2),
.en_bf1_3	(en_bf1_3),
.en_bf1_4	(en_bf1_4),
.en_bf2_1	(en_bf2_1),
.en_bf2_2	(en_bf2_2),
.en_bf3		(en_bf3),
.x0(x0),
.x1(x1),
.x2(x2),
.x3(x3),	
.x4(x4),
.x5(x5),
.x6(x6),
.x7(x7),	

.X_0_re(X_0_re),.X_1_re(X_1_re),
.X_4_re(X_4_re),.X_5_re(X_5_re),
.X_0_im(X_0_im),.X_1_im(X_1_im),
.X_4_im(X_4_im),.X_5_im(X_5_im),
.X_2_re(X_2_re),.X_3_re(X_3_re),
.X_6_re(X_6_re),.X_7_re(X_7_re),
.X_2_im(X_2_im),.X_3_im(X_3_im),
.X_6_im(X_6_im),.X_7_im(X_7_im)
);

endmodule