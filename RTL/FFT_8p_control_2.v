/*  written by      :   Mohamed S. Helal
    date created   	:   Mar, 9th, 2025
    description     :   This is the main controller FSM(Mealy), 
						it outputa an 8-point fft
						each 8 cycles with 11 cycle latency, old one was worse but it's now lost lol
    version         :   0.1
*/

module FFT_8p_control_2 (
input  wire        clk,
input  wire        reset_n,
input  wire        start,
output reg         en_s2p,
output reg         en_bf1_1,
output reg         en_bf1_2,
output reg         en_bf1_3,
output reg         en_bf1_4,
output reg         en_bf2_1,
output reg         en_bf2_2,
output reg         en_bf3
);

reg [2:0] 	cycle_count;
reg			toggle_start;	//one start pulse sets or resets

// State transition
always @(posedge clk, negedge reset_n) begin
    if (!reset_n) 
	begin
        cycle_count <= 0;
		en_s2p <= 0;
		toggle_start <= 0;
    end 
	
	else if(start)	//start resets the counter and toggles the operation
	begin
        cycle_count <= 0;
		en_s2p <= 0;
		toggle_start <= ~toggle_start;
	end
	
	else if(toggle_start)	//start operation if the state is toggled
	begin
		
        cycle_count <= cycle_count + 1;
		en_s2p <= 1;
    end
	else
	begin
		cycle_count <= 0;
		en_s2p <= 0;
	end
end

always@(*)
begin
	en_bf1_1 = 0;
	en_bf1_2 = 0;
	en_bf1_3 = 0;
	en_bf1_4 = 0;
	en_bf2_1 = 0;
	en_bf2_2 = 0;
	en_bf3	 = 0;
	case(cycle_count)
		3'd1: begin 
			en_bf1_4 = 1;	
		end
		3'd2: begin 
			en_bf2_2 = 1;
		end
		3'd3: begin 
			en_bf1_1 = 1;	
			en_bf3 = 1;	
		end
		3'd5: begin
			en_bf1_2 = 1;
		end
		3'd6: begin
			en_bf2_1 = 1;
		end
		3'd7: begin
			en_bf1_3 = 1;
		end
	endcase
end


endmodule

