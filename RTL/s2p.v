/*	written by		:	Mohamed S. Helal 
	date created	: 	Mar, 4th, 2025
	description		:	Serial to parallel shift register
	version			:	0.0
*/

module s2p (
input	wire				clk,reset_n,
input	wire				en,
input	wire	[15:0]		s_in,
output	wire	[15:0]		p_out0,p_out1,p_out2,p_out3,
							p_out4,p_out5,p_out6,p_out7
);                          
//internal regs
reg [15:0]	reg_x_out [7:0];
reg [2:0]	index;

integer i;		//loop variable
//behavioural description of s2p
always@(posedge clk,negedge reset_n)
begin
	if(!reset_n)
	begin
		for (i = 0; i<8;i = i+1)
			reg_x_out[i] <= 16'b0;
		index <= 3'b0;
	end
	
	else if(en)
	begin
		//load data in the current index
		//this will basically generate a huge mux
		reg_x_out[index] <= s_in;	
		index <= index + 1'b1;		//increment index
	end
end

//output port assignment, don't like ports as regs
assign p_out0 = reg_x_out [0];
assign p_out1 = reg_x_out [1];
assign p_out2 = reg_x_out [2];
assign p_out3 = reg_x_out [3];
assign p_out4 = reg_x_out [4];
assign p_out5 = reg_x_out [5];
assign p_out6 = reg_x_out [6];
assign p_out7 = reg_x_out [7];

endmodule