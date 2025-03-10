## testing the algorithm on matlab
## just for practice
## I'm not a sw guy so bare with me
close all
clear all;

w8 = twid(8);   ## !effedient function that generates twiddle factors

%% test signal and its verified FFT
x_n = [501,604,230,-1015,2324,-304,-530,1715];
FFT_x_n_ready = fft(x_n);


%% FFT butterfly functions
function [X_0, X_1] = bf1(x_0, x_1)
    X_0 = x_0 + x_1;
    X_1 = x_0 - x_1;
endfunction

function [X_0, X_1, X_2, X_3] = bf2(x_0, x_1, x_2, x_3)
    w8 = twid(8);
    X_0 = x_0 + x_2;
    X_1 = x_1 + w8(2+1) * x_3;
    X_2 = x_0 - x_2;
    X_3 = x_1 - w8(2+1) * x_3;
endfunction

%% example signals
function [X_0, X_1, X_2, X_3, X_4, X_5, X_6, X_7] = bf4(x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7)
    w8 = twid(8);
    X_0 = x_0 + w8(0+1) * x_4;
    X_1 = x_1 + w8(1+1) * x_5;
    X_2 = x_2 + w8(2+1) * x_6;
    X_3 = x_3 + w8(3+1) * x_7;
    X_4 = x_0 - w8(0+1) * x_4;
    X_5 = x_1 - w8(1+1) * x_5;
    X_6 = x_2 - w8(2+1) * x_6;
    X_7 = x_3 - w8(3+1) * x_7;
endfunction

%% trying the new FFT architecture
## first stage
[C_0, C_1] = bf1(x_n(0+1), x_n(4+1));
[D_0, D_1] = bf1(x_n(2+1), x_n(6+1));
[E_0, E_1] = bf1(x_n(1+1), x_n(5+1));
[F_0, F_1] = bf1(x_n(3+1), x_n(7+1));

## second stage
[A_0, A_1, A_2, A_3] = bf2(C_0, C_1, D_0, D_1);
[B_0, B_1, B_2, B_3] = bf2(E_0, E_1, F_0, F_1);

## third stage
x = zeros(1,8);
[x(1), x(2), x(3), x(4), x(5), x(6), x(7), x(8)] = bf4(A_0, A_1, A_2, A_3, B_0, B_1, B_2, B_3);
## comparison
tolerance = 1e-5;
if (abs( abs(x) - abs(FFT_x_n_ready) ) < tolerance)  ## compare up to tolerance of 1x10^-5
    subplot(3,1,1);
    stem(abs(x_n));
    subplot(3,1,2);
    stem(abs(x));
    subplot(3,1,3);
    stem(abs(FFT_x_n_ready));
    printf("fft successful! \n")
endif

## for generating test vectors for verilog
bf2_res_1 = [A_0, A_1, A_2, A_3]
bf2_res_2 = [B_0, B_1, B_2, B_3]
bf4_res_1 = [x(1), x(2), x(3), x(4), x(5), x(6), x(7), x(8)]

testvec = dec2bin(x_n,16);
result1_real = dec2bin(real(bf2_res_1),16);
result1_imag = dec2bin(imag(bf2_res_1),16);
result2_real = dec2bin(real(bf2_res_2),16);
result2_imag = dec2bin(imag(bf2_res_2),16);
x_n = [1107,-11115,5400,1015,-18700,-2504,-2709,2024];
