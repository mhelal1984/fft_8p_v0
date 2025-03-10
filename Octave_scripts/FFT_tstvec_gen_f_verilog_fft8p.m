N = 8                   ##number of 8-point vectors to generate
n = randomNumbers(8*N);

writeArrayToFile("testvecROM.txt",n);

## initiate fft result seqmentation
fft_result_all = [];
for i = 1:8:(8*N)   ## this loop cuts n into 8 chunks, performs fft
  segment = n(i:i+7);
  fft_res = fft(segment,8);
  fft_result_all = [fft_result_all,fft_res];  ## then concats the result into one vector
endfor


FFT_n_real = fix(real(fft_result_all));   # using fix function to discard fractionsfic
FFT_n_imag = fix(imag(fft_result_all));
writeArrayToFile("FFT_oct_res_real.txt",FFT_n_real);  ## writing the result into two
writeArrayToFile("FFT_oct_res_imag.txt",FFT_n_imag);  ## files,for real and imaginary profucts
