/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 6th, 2025
	description		:	Butterfly block stage 2: computes second stage result(A0,A1,A2,A3...etc) 
						from first stage (C0,C1..D0,D1...etc)
	version			:	0.0
*/
module BF2 (
input	wire				clk,reset_n,en,
input	wire	[15:0]		C_0_re,
							C_1_re,
							D_0_re,
							D_1_re,
//							
output	reg		[15:0]		A_0_re,
							A_1_re,A_1_im,
							A_2_re,
							A_3_re,A_3_im
);



always@(posedge clk,negedge reset_n)
begin
	if(!reset_n)
	begin
		A_0_re <= 16'b0;	// A_0_im <= 16'b0; leaving this to avoid confusion
		A_1_re <= 16'b0;	A_1_im <= 16'b0;
		A_2_re <= 16'b0;	// A_2_im <= 16'b0;
		A_3_re <= 16'b0;	A_3_im <= 16'b0;
	end
	
	else if (en)
	begin
	// Twiddle factor is hardwired (not the best practice but 
	// my top priority is to get it to work)
		/*/
			A_0_im <= 0;					
			both imaginary parts are zero /*/
		A_0_re <= C_0_re + D_0_re;
		
		/*/
			instead of complex multiplaction by W8_2 = -j
			and C_1_im = D_1_im = 0 
			so it's just A_1_im = -D_1_re = two's comp. of D_1_re
			and 		 A_1_re = +C_1_re /*/
		A_1_re <= C_1_re;	A_1_im <= (~D_1_re) + 1'b1;	
		
		/*/
			A_2_im <= 0;	
			both imaginary parts are zero /*/
		A_2_re <= C_0_re - D_0_re;
		
		/*/
			instead of complex multiplaction by W8_2 = -j
			and C_1_im = D_1_im = 0 
			so it's just A_3_im = +D_1_re 
			and 		 A_3_re = +C_1_re /*/
		A_3_re <= C_1_re;	A_3_im <= D_1_re;				
	end
end


endmodule