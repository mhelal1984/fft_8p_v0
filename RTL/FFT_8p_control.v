/*  written by      :   Mohamed S. Helal
    date created   	:   Mar, 9th, 2025
    description     :   !! not final version!! This is the main controller FSM(Mealy), 
						theoritically it can be made to output an 8-point fft
						each 8 cycles with 11 cycle latency
						just need a better S2P or a FIFO
    version         :   0.1
*/

module FFT_8p_control (
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

// State encoding
reg [2:0] 	cycle_count;

endmodule

