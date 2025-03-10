/*	written by		:	Mohamed S. Helal 
	date created		: 	Mar, 4th, 2025
	description		:	testbench for Serial to parallel shift register , 
	version			:	0.0
*/

module tb_s2p ();

//tb simulation signals 
reg					clk,reset_n;
reg					en;
reg		[15:0]		s_in;
wire	[15:0]		p_out0,p_out1,p_out2,p_out3,
					p_out4,p_out5,p_out6,p_out7;

s2p DUT (
.clk	(clk	),
.reset_n(reset_n),
.en		(en		),
.s_in	(s_in	),
.p_out0	(p_out0	),
.p_out1	(p_out1	),
.p_out2	(p_out2	),
.p_out3	(p_out3	),
.p_out4	(p_out4	),
.p_out5	(p_out5	),
.p_out6	(p_out6	),
.p_out7 (p_out7 )
);

//parameters to avoid confusion
parameter HALF_CLK 		= 5;
parameter CLK_PERIODE  	= 2 * HALF_CLK;
parameter RST_PERIODE 	= 3;

//test sequence Driver
initial begin
	clk		 = 1'b0;
	reset_n  = 1'b0;
	en		 = 1'b0;
	s_in	 = 16'd0;
	#RST_PERIODE
	reset_n  = 1'b1;
	#(CLK_PERIODE - RST_PERIODE)	//now on first negedge clk
	s_in	 = 16'd10;
	en = 1;
	#CLK_PERIODE;
	repeat(8)			//register the values from 0 to 7 for 8 clk cycles
	begin
		@(negedge clk)
		s_in = s_in + 1'b1;
	end
	en = 0;
	
	#(8*CLK_PERIODE)
	$stop;
end

//test monitor
initial
begin
	$monitor("Time=%0t | p_out0=%d p_out1=%d p_out2=%d  p_out3=%d p_out4=%d p_out5=%d  p_out6=%d p_out7=%d ", 
             $time, 		p_out0,	p_out1,	p_out2,	p_out3,	p_out4,	p_out5,	p_out6,	p_out7);
end    

//clock generator
always #HALF_CLK clk = ~clk;

endmodule