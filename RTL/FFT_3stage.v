/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 8th, 2025
	description		:	integration of the 4 bf1 blocks, 2 bf2 and a bf4 block
						according to my tests and textbook notes it should work idk lol
	version			:	0.0
*/

module FFT_3stage (
input	wire			clk,reset_n,
input	wire			en_bf1_1,en_bf1_2,en_bf1_3,en_bf1_4,
input	wire			en_bf2_1,en_bf2_2,
input	wire			en_bf3,
//time domain signal
input	wire	[15:0]	x0,x1,x2,x3,	
						x4,x5,x6,x7,	
//frequency domain signal
output	wire	[15:0]	X_0_re,X_1_re,X_2_re,X_3_re,
                        X_4_re,X_5_re,X_6_re,X_7_re,
						X_0_im,X_1_im,X_2_im,X_3_im,
						X_4_im,X_5_im,X_6_im,X_7_im
);

//internal signals
wire	[15:0]		C_0_re,C_1_re,D_0_re,D_1_re,	//stage I
					E_0_re,E_1_re,F_0_re,F_1_re,	//stage I
					A_0_re,A_1_re,A_1_im,			//stage II
					A_2_re,A_3_re,A_3_im,			//stage II
					B_0_re,B_1_re,B_1_im,			//stage II
					B_2_re,B_3_re,B_3_im;			//stage II

//stage I Butterfly blocks
BF1 U1 (
	.clk	(clk),
	.reset_n(reset_n),
	.x_0_re	(x0),
	.x_1_re	(x1),
	.en 	(en_bf1_1),
	.g_0_re	(C_0_re),
	.g_1_re	(C_1_re)
);
BF1 U2 (
	.clk	(clk),
	.reset_n(reset_n),
	.x_0_re	(x2),
	.x_1_re	(x3),
	.en 	(en_bf1_2),
	.g_0_re	(D_0_re),
	.g_1_re	(D_1_re)
);
BF1 U3 (
	.clk	(clk),
	.reset_n(reset_n),
	.x_0_re	(x4	),
	.x_1_re	(x5	),
	.en 	(en_bf1_3),
	.g_0_re	(E_0_re),
	.g_1_re	(E_1_re)
);
BF1 U4 (
	.clk	(clk),
	.reset_n(reset_n),
	.x_0_re	(x6),
	.x_1_re	(x7),
	.en 	(en_bf1_4),
	.g_0_re	(F_0_re	),
	.g_1_re	(F_1_re	)
);

//stage II Butterfly blocks
BF2 U5 (
	.clk	(clk),		//outputs	
	.reset_n(reset_n),	.A_0_re	(A_0_re),
	.C_0_re	(C_0_re),	.A_1_re	(A_1_re),
	.C_1_re	(C_1_re),	.A_1_im (A_1_im),
	.D_0_re	(D_0_re),	.A_2_re	(A_2_re),
	.D_1_re	(D_1_re),	.A_3_re	(A_3_re),
	.en 	(en_bf2_1),	.A_3_im (A_3_im)
);
BF2 U6 (
	.clk	(clk),		//outputs
	.reset_n(reset_n),	.A_0_re	(B_0_re),
	.C_0_re	(E_0_re),	.A_1_re	(B_1_re),
	.C_1_re	(E_1_re),	.A_1_im (B_1_im),
	.D_0_re	(F_0_re),	.A_2_re	(B_2_re),
	.D_1_re	(F_1_re),	.A_3_re	(B_3_re),
	.en 	(en_bf2_2),	.A_3_im (B_3_im)
);

// stage III Butterfly block
BF4 U7 (
.clk	(clk),
.reset_n(reset_n),
.en		(en_bf3),
.A_0_re(A_0_re),
.A_1_re(A_1_re),.A_1_im(A_1_im),
.A_2_re(A_2_re),
.A_3_re(A_3_re),.A_3_im(A_3_im),
.B_0_re(B_0_re),
.B_1_re(B_1_re),.B_1_im(B_1_im),
.B_2_re(B_2_re),
.B_3_re(B_3_re),.B_3_im(B_3_im),
//outputs
.X_0_re(X_0_re),.X_0_im(X_0_im),
.X_1_re(X_1_re),.X_1_im(X_1_im),
.X_2_re(X_2_re),.X_2_im(X_2_im),
.X_3_re(X_3_re),.X_3_im(X_3_im),
.X_4_re(X_4_re),.X_4_im(X_4_im),
.X_5_re(X_5_re),.X_5_im(X_5_im),
.X_6_re(X_6_re),.X_6_im(X_6_im),
.X_7_re(X_7_re),.X_7_im(X_7_im)
);

endmodule