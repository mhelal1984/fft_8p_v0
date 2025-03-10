onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_bf2/clk
add wave -noupdate /tb_bf2/reset_n
add wave -noupdate -expand -group inputs -radix decimal /tb_bf2/x_0_re
add wave -noupdate -expand -group inputs -radix decimal /tb_bf2/x_4_re
add wave -noupdate -expand -group inputs -radix decimal /tb_bf2/x_2_re
add wave -noupdate -expand -group inputs -radix decimal /tb_bf2/x_6_re
add wave -noupdate -expand -group {intermediate results} -radix decimal /tb_bf2/C_0_re
add wave -noupdate -expand -group {intermediate results} -radix decimal /tb_bf2/C_1_re
add wave -noupdate -expand -group {intermediate results} -radix decimal /tb_bf2/D_0_re
add wave -noupdate -expand -group {intermediate results} -radix decimal /tb_bf2/D_1_re
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_0_re
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_0_im
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_1_re
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_1_im
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_2_re
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_2_im
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_3_re
add wave -noupdate -expand -group {output pairs (real + i * img)} -radix decimal /tb_bf2/A_3_im
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ns} 0}
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
WaveRestoreZoom {0 ns} {21 ns}
