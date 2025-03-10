/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 8th, 2025
	description		:	testbench for Butterfly block stage 2: computes second stage  
						result(A0,A1,A2,A3...etc) from first stage (C0,C1..D0,D1...etc) 
	version			:	0.0
*/
module tb_bf2();

//test signals
reg					clk,reset_n;
reg		[15:0]		x_0_re,x_4_re,x_2_re,x_6_re;
wire	[15:0]		C_0_re,
                    C_1_re,
                    D_0_re,
                    D_1_re;



wire	[15:0]		A_0_re,
					A_1_re,A_1_im,
					A_2_re,
					A_3_re,A_3_im;

//test parameters
parameter HALF_CLK = 5;
parameter CLK_PERIOD = 2*HALF_CLK;
parameter RST_PERIODE = 2;
//module instantiations
	//DUT
	BF2 DUT (
	.clk	(clk),
	.reset_n(reset_n),
	.C_0_re	(C_0_re),
	.C_1_re	(C_1_re),
	.D_0_re	(D_0_re),
	.D_1_re	(D_1_re),
	//outputs
	.A_0_re	(A_0_re),
	.A_1_re	(A_1_re), .A_1_im(A_1_im),
	.A_2_re	(A_2_re),
	.A_3_re	(A_3_re), .A_3_im(A_3_im)
	);
	
	//verified BF1(stage I butterfly) blocks 
	BF1 U1 (
	.clk	(clk	),
	.reset_n(reset_n),
	.x_0_re	(x_0_re	),
	.x_1_re	(x_4_re	),
	.g_0_re	(C_0_re	),
	.g_1_re	(C_1_re	)
	);
	BF1 U2 (
	.clk	(clk	),
	.reset_n(reset_n),
	.x_0_re	(x_2_re	),
	.x_1_re	(x_6_re	),
	.g_0_re	(D_0_re	),
	.g_1_re	(D_1_re	)
	);
//test sequence
initial begin
	clk = 0;
	reset_n = 0;
	x_0_re = 16'b0;
	x_2_re = 16'b0;
	x_4_re = 16'b0;
	x_6_re = 16'b0;
	
	#RST_PERIODE
	reset_n = 1;
	
	x_0_re =   16'd501;	
	x_4_re =   16'd2324;	
	x_2_re =   16'd230;	
	x_6_re = - 16'd530;	
	
	#(CLK_PERIOD - RST_PERIODE)
	
	x_0_re =   16'd604;	
	x_4_re = - 16'd304;	
	x_2_re = - 16'd1015;	
	x_6_re =   16'd1715;	

	#(2*CLK_PERIOD)
	$stop;
	
end

//test monitor
initial
begin
	$monitor("Time=%0t | A[0] = %d + 0 i | A[1] = %d + %d i | A[2] = %d + 0 i | A[3] = %d + %d i", 
             $time, 
			 $signed(A_0_re),
			 $signed(A_1_re),$signed(A_1_im),
			 $signed(A_2_re),
			 $signed(A_3_re),$signed(A_3_im));
end    



//clock generator
always #(HALF_CLK)	clk = ~clk;

endmodule