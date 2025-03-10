/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 8th, 2025
	description		:	testbench of the 8-point FFT datapath
	version			:	0.0
*/
module tb_FFT_3stage();

//internal signals 
reg			clk,reset_n,en_bf1_1,en_bf1_2,en_bf1_3,	
			en_bf1_4,en_bf2_1,en_bf2_2,en_bf3;	

reg [15:0]	x0,x1,x2,x3,
            x4,x5,x6,x7;

wire[15:0]	X_0_re,X_1_re,
            X_4_re,X_5_re,
            X_0_im,X_1_im,
            X_4_im,X_5_im,
            X_2_re,X_3_re,
            X_6_re,X_7_re,
            X_2_im,X_3_im,
            X_6_im,X_7_im;			
//test parameters
parameter HALF_CLK = 5;
parameter CLK_PERIOD = 2*HALF_CLK;
parameter RST_PERIODE = 2;


FFT_3stage DUT (
.clk		(clk	),
.reset_n	(reset_n),
.en_bf1_1	(en_bf1_1),
.en_bf1_2	(en_bf1_2),
.en_bf1_3	(en_bf1_3),
.en_bf1_4	(en_bf1_4),
.en_bf2_1	(en_bf2_1),
.en_bf2_2	(en_bf2_2),
.en_bf3		(en_bf3	),
//input vector is ordered for easier testing
.x0(x0),
.x1(x4),
.x2(x2),
.x3(x6),	
.x4(x1),
.x5(x5),
.x6(x3),
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

//test sequence
initial begin
	clk = 0;
	reset_n = 0;
	x0 =  16'd0;
	x1 =  16'd0;
	x2 =  16'd0;
	x3 =  16'd0;
	x4 =  16'd0;
	x5 =  16'd0;
	x6 =  16'd0;
	x7 =  16'd0;
	
	en_bf1_1 = 1;	
	en_bf1_2 = 1;	
	en_bf1_3 = 1;	
	en_bf1_4 = 1;	
	en_bf2_1 = 1;	
	en_bf2_2 = 1;	
	en_bf3	 = 1;
	
	#RST_PERIODE
	reset_n = 1;
	
	x0 =  16'd501;
	x1 =  16'd604;
	x2 =  16'd230;
	x3 = -16'd1015;
	x4 =  16'd2324;
	x5 = -16'd304;
	x6 = -16'd530;
	x7 =  16'd1715;
	
	#(CLK_PERIOD - RST_PERIODE)
	#(3*CLK_PERIOD)
	
	x0 =  16'd1107;
	x1 =  -16'd11115;
	x2 =  16'd5400;
	x3 = -16'd1015;
	x4 = -16'd18700;
	x5 = -16'd2504;
	x6 = -16'd2709;
	x7 =  16'd2024;
	
	#(4*CLK_PERIOD)
	$stop;
end

//clock generator
always #(HALF_CLK)	clk = ~clk;


endmodule