/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 7th, 2025
	description		:	Butterfly block stage 3: computes third stage result(X0,X1,X2...etc)
						from second stage results (A0,A1,A2,A3...etc)
	version			:	0.0
*/
module BF4 (
input	wire				clk,reset_n,en,
input	wire		[15:0]	A_0_re,//A_0_im,
							A_1_re,A_1_im,
							A_2_re,//A_2_im,
							A_3_re,A_3_im,
							B_0_re,//B_0_im,
							B_2_re,//B_2_im,
input wire	signed	[15:0]	B_3_re,B_3_im,	//for signed multiplication
							B_1_re,B_1_im,
//							
output	reg		[15:0]		X_0_re,X_0_im,
							X_1_re,X_1_im,
							X_2_re,X_2_im,
							X_3_re,X_3_im,
							X_4_re,X_4_im,
							X_5_re,X_5_im,
							X_6_re,X_6_im,
							X_7_re,X_7_im
);


// note1:these twiddle factors are multiplied by 2^15
// 		 as I have abandond the fixed point system twoards 
// 		 the end of the project, that's why after each 16-bit
// 		 multiplication, I reshift the numbers back into position
// note2:MATLAB function for generating W8_n to hex values
// 		 is included in the project in /octave_scripts
reg signed [15:0] 		W8_1_re =  16'h5A82, W8_1_im = -16'h5A82,
						W8_3_re = -16'h5A82, W8_3_im = -16'h5A82;

//complex multiplication:
	//complex mult. registers (32*bits and then truncated to 16)
	wire signed [31:0]	x1_x5_re_res_32,x1_x5_im_res_32,
                        x3_x7_re_res_32,x3_x7_im_res_32;
	wire signed [15:0]	x1_x5_re_res,x1_x5_im_res,
                        x3_x7_re_res,x3_x7_im_res;

	assign x1_x5_re_res_32 = ((B_1_re) * (W8_1_re)) - ((B_1_im) * (W8_1_im));
	assign x1_x5_im_res_32 = ((B_1_re) * (W8_1_im)) + ((B_1_im) * (W8_1_re));
	assign x3_x7_re_res_32 = ((B_3_re) * (W8_3_re)) - ((B_3_im) * (W8_3_im));
	assign x3_x7_im_res_32 = ((B_3_re) * (W8_3_im)) + ((B_3_im) * (W8_3_re));

	assign x1_x5_re_res = x1_x5_re_res_32 >>> 15;
	assign x1_x5_im_res = x1_x5_im_res_32 >>> 15;
	assign x3_x7_re_res = x3_x7_re_res_32 >>> 15;
	assign x3_x7_im_res = x3_x7_im_res_32 >>> 15;



always@(posedge clk,negedge reset_n)
begin
	if(!reset_n)
	begin
		X_0_re <= 32'b0;	X_0_im <= 32'b0;
		X_1_re <= 32'b0;	X_1_im <= 32'b0;
		X_2_re <= 32'b0;	X_2_im <= 32'b0;
		X_3_re <= 32'b0;	X_3_im <= 32'b0;
		X_4_re <= 32'b0;	X_4_im <= 32'b0;
		X_5_re <= 32'b0;	X_5_im <= 32'b0;
		X_6_re <= 32'b0;	X_6_im <= 32'b0;
		X_7_re <= 32'b0;	X_7_im <= 32'b0;
	end
	
	else if(en)		//complex multiplication is decomposed
	begin
		//X0
		X_0_re <= A_0_re + B_0_re;	X_0_im <= 0;		
		
		//X1
		X_1_re <= A_1_re + x1_x5_re_res;	// complex multiplication results 
		X_1_im <= A_1_im + x1_x5_im_res;	// complex multiplication results 
		
		//X2
		X_2_re <= A_2_re ;		X_2_im <= - B_2_re;	//instead of complex multiplaction by W8_2 = -j
		
		//X3
		X_3_re <= A_3_re + x3_x7_re_res;	
		X_3_im <= A_3_im + x3_x7_im_res;
		
		//X4
		X_4_re <= A_0_re - B_0_re;	X_4_im <= 0;		
		
		//X5
		X_5_re <= A_1_re - x1_x5_re_res;	// complex multiplication results
		X_5_im <= A_1_im - x1_x5_im_res;    // complex multiplication results
		
		//X6
		X_6_re <= A_2_re;		X_6_im <= B_2_re; //instead of complex multiplaction by W8_2 = -j
		
		//X7
		X_7_re <= A_3_re - x3_x7_re_res;	// complex multiplication results
		X_7_im <= A_3_im - x3_x7_im_res;    // complex multiplication results
	end
end		

endmodule