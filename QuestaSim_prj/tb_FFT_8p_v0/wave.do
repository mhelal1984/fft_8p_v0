onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_FFT_datapath/HALF_CLK
add wave -noupdate /tb_FFT_datapath/CLK_PERIOD
add wave -noupdate /tb_FFT_datapath/RST_PERIODE
add wave -noupdate /tb_FFT_datapath/index
add wave -noupdate /tb_FFT_datapath/clk
add wave -noupdate /tb_FFT_datapath/reset_n
add wave -noupdate /tb_FFT_datapath/start
add wave -noupdate /tb_FFT_datapath/en_s2p
add wave -noupdate /tb_FFT_datapath/en_bf1_1
add wave -noupdate /tb_FFT_datapath/en_bf1_2
add wave -noupdate /tb_FFT_datapath/en_bf1_3
add wave -noupdate /tb_FFT_datapath/en_bf1_4
add wave -noupdate /tb_FFT_datapath/en_bf2_1
add wave -noupdate /tb_FFT_datapath/en_bf2_2
add wave -noupdate /tb_FFT_datapath/en_bf3
add wave -noupdate /tb_FFT_datapath/s_in
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x0
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x1
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x2
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x3
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x4
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x5
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x6
add wave -noupdate -height 20 -expand -group xn_internal /tb_FFT_datapath/DUT/FFT_stages/x7
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_0_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_0_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_1_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_1_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_2_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_2_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_3_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_3_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_4_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_4_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_5_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_5_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_6_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_6_im
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_7_re
add wave -noupdate -height 30 -expand -group FFT(xn) -height 30 -radix hexadecimal /tb_FFT_datapath/X_7_im
add wave -noupdate -expand -group FSM /tb_FFT_datapath/FSM/state
add wave -noupdate -expand -group FSM /tb_FFT_datapath/FSM/cycle_count
add wave -noupdate -expand -group ROM /tb_FFT_datapath/ROM/addr
add wave -noupdate -expand -group ROM /tb_FFT_datapath/ROM/dout
add wave -noupdate -expand -group ROM /tb_FFT_datapath/ROM/rom
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54 ns} 0}
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
WaveRestoreZoom {0 ns} {389 ns}
