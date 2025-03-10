/*  written by      :   Mohamed S. Helal
    date created   	:   Mar, 9th, 2025
    description     :   Test bench for the simple FSM 
    version         :   0.0
*/

module tb_FFT_8p_control;
    reg clk;
    reg reset_n;
    reg start;
    wire en_s2p;
    wire en_bf1_1, en_bf1_2, en_bf1_3, en_bf1_4;
    wire en_bf2_1, en_bf2_2, en_bf3;

    // Instantiate FSM
    FFT_8p_control DUT (
        .clk(clk),
        .reset_n(reset_n),
        .start(start),
        .en_s2p(en_s2p),
        .en_bf1_1(en_bf1_1),
        .en_bf1_2(en_bf1_2),
        .en_bf1_3(en_bf1_3),
        .en_bf1_4(en_bf1_4),
        .en_bf2_1(en_bf2_1),
        .en_bf2_2(en_bf2_2),
        .en_bf3(en_bf3)
    );

    // Generate clock
    always #5 clk = ~clk;  // 10ns clock period

    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        start = 0;

        // Reset sequence
        #10 reset_n = 1;

        // Start the FSM after reset
        #15 start = 1;
        #10 start = 0;
    
        // Observe FSM behavior
        #200;
        
        // End simulation
        $stop;
    end

    // Monitor output signals
    initial begin
        $monitor($time, " en_s2p=%b, en_bf1_1=%b, en_bf1_2=%b, en_bf1_3=%b, en_bf1_4=%b, en_bf2_1=%b, en_bf2_2=%b, en_bf3=%b", 
                 en_s2p, en_bf1_1, en_bf1_2, en_bf1_3, en_bf1_4, en_bf2_1, en_bf2_2, en_bf3);
    end
endmodule
