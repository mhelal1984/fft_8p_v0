/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 4th, 2025
	description		:	Butterfly block stage I: computes first stage result(x0,x4..x1,x5...etc)
	version			:	0.0
*/
module BF1 (
input	wire				clk,reset_n,en,
input	wire	[15:0]		x_0_re,			// input sequence x[n] is always real valued
							x_1_re,			// input sequence x[n] is always real valued
//
output	reg		[15:0]		g_0_re,			// no need for img parts as it's always zero
							g_1_re          // no need for img parts as it's always zero
);

always@(posedge clk,negedge reset_n)
begin
	if(!reset_n)
	begin
		g_0_re <= 16'b0;
		g_1_re <= 16'b0;
	end
	
	else if(en)
	begin
		g_0_re <= x_0_re + x_1_re;
		g_1_re <= x_0_re - x_1_re;
	end
end

endmodule