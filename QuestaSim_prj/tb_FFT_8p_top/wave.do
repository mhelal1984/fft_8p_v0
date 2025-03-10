onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_FFT_top/clk
add wave -noupdate /tb_FFT_top/reset_n
add wave -noupdate /tb_FFT_top/start
add wave -noupdate /tb_FFT_top/s_in
add wave -noupdate /tb_FFT_top/loading
add wave -noupdate /tb_FFT_top/X_0_re
add wave -noupdate /tb_FFT_top/X_0_im
add wave -noupdate /tb_FFT_top/X_1_re
add wave -noupdate /tb_FFT_top/X_1_im
add wave -noupdate /tb_FFT_top/X_2_re
add wave -noupdate /tb_FFT_top/X_2_im
add wave -noupdate /tb_FFT_top/X_3_re
add wave -noupdate /tb_FFT_top/X_3_im
add wave -noupdate /tb_FFT_top/X_4_re
add wave -noupdate /tb_FFT_top/X_4_im
add wave -noupdate /tb_FFT_top/X_5_re
add wave -noupdate /tb_FFT_top/X_5_im
add wave -noupdate /tb_FFT_top/X_6_re
add wave -noupdate /tb_FFT_top/X_6_im
add wave -noupdate /tb_FFT_top/X_7_re
add wave -noupdate /tb_FFT_top/X_7_im
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x0
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x1
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x2
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x3
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x4
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x5
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x6
add wave -noupdate -height 20 -expand -group {FFT_input x[n]} /tb_FFT_top/DUT/DP/x7
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/s_in
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_s2p
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf1_1
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf1_2
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf1_3
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf1_4
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf2_1
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf2_2
add wave -noupdate -height 20 -expand -group {serial_in and bufen} /tb_FFT_top/DUT/DP/en_bf3
add wave -noupdate /tb_FFT_top/DUT/ctrl/cycle_count
add wave -noupdate -height 20 -expand -group BF1_1 /tb_FFT_top/DUT/DP/FFT_stages/C_0_re
add wave -noupdate -height 20 -expand -group BF1_1 /tb_FFT_top/DUT/DP/FFT_stages/C_1_re
add wave -noupdate -height 20 -expand -group BF1_2 /tb_FFT_top/DUT/DP/FFT_stages/D_0_re
add wave -noupdate -height 20 -expand -group BF1_2 /tb_FFT_top/DUT/DP/FFT_stages/D_1_re
add wave -noupdate -height 20 -expand -group BF2_1 /tb_FFT_top/DUT/DP/FFT_stages/A_0_re
add wave -noupdate -height 20 -expand -group BF2_1 /tb_FFT_top/DUT/DP/FFT_stages/A_1_re
add wave -noupdate -height 20 -expand -group BF2_1 /tb_FFT_top/DUT/DP/FFT_stages/A_1_im
add wave -noupdate -height 20 -expand -group BF2_2 /tb_FFT_top/DUT/DP/FFT_stages/B_0_re
add wave -noupdate -height 20 -expand -group BF2_2 /tb_FFT_top/DUT/DP/FFT_stages/B_1_re
add wave -noupdate -height 20 -expand -group BF2_2 /tb_FFT_top/DUT/DP/FFT_stages/B_1_im
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 50
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {485 ns}
