onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_FFT_3stage/HALF_CLK
add wave -noupdate -radix decimal /tb_FFT_3stage/CLK_PERIOD
add wave -noupdate -radix decimal /tb_FFT_3stage/RST_PERIODE
add wave -noupdate -radix decimal /tb_FFT_3stage/clk
add wave -noupdate -radix decimal /tb_FFT_3stage/reset_n
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf1_1
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf1_2
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf1_3
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf1_4
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf2_1
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf2_2
add wave -noupdate -radix decimal /tb_FFT_3stage/en_bf3
add wave -noupdate -radix decimal /tb_FFT_3stage/x0
add wave -noupdate -radix decimal /tb_FFT_3stage/x1
add wave -noupdate -radix decimal /tb_FFT_3stage/x2
add wave -noupdate -radix decimal /tb_FFT_3stage/x3
add wave -noupdate -radix decimal /tb_FFT_3stage/x4
add wave -noupdate -radix decimal /tb_FFT_3stage/x5
add wave -noupdate -radix decimal /tb_FFT_3stage/x6
add wave -noupdate -radix decimal /tb_FFT_3stage/x7
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_0_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_0_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_1_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_1_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_2_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_2_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_3_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_3_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_4_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_4_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_5_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_5_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_6_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_6_im
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_7_re
add wave -noupdate -color Gold -height 40 -radix decimal /tb_FFT_3stage/X_7_im
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix binary /tb_FFT_3stage/DUT/U7/x1_x5_re_res_32
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix binary /tb_FFT_3stage/DUT/U7/x1_x5_im_res_32
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix binary /tb_FFT_3stage/DUT/U7/x3_x7_re_res_32
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix binary /tb_FFT_3stage/DUT/U7/x3_x7_im_res_32
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix decimal /tb_FFT_3stage/DUT/U7/x1_x5_re_res
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix decimal /tb_FFT_3stage/DUT/U7/x1_x5_im_res
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix decimal /tb_FFT_3stage/DUT/U7/x3_x7_re_res
add wave -noupdate -height 20 -expand -group complex_mult -color Cyan -radix decimal /tb_FFT_3stage/DUT/U7/x3_x7_im_res
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_0_re
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_1_re
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_1_im
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_2_re
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_3_re
add wave -noupdate -expand -group BF2_1 -radix decimal /tb_FFT_3stage/DUT/U5/A_3_im
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_0_re
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_1_re
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_1_im
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_2_re
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_3_re
add wave -noupdate -expand -group BF2_2 -radix decimal /tb_FFT_3stage/DUT/U6/A_3_im
add wave -noupdate -height 20 -expand -group twiddle -color Red -radix decimal /tb_FFT_3stage/DUT/U7/W8_1_re
add wave -noupdate -height 20 -expand -group twiddle -color Red -radix decimal /tb_FFT_3stage/DUT/U7/W8_1_im
add wave -noupdate -height 20 -expand -group twiddle -color Red -radix decimal /tb_FFT_3stage/DUT/U7/W8_3_re
add wave -noupdate -height 20 -expand -group twiddle -color Red -radix decimal /tb_FFT_3stage/DUT/U7/W8_3_im
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {46 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
configure wave -valuecolwidth 167
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
WaveRestoreZoom {45 ns} {114 ns}
