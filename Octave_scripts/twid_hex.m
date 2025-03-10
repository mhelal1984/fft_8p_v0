## use example: [w8_re_hex,w8_im_hex] = twid_hex(8)
## this functions take the twiddle factors generated by twid(N)
## and scales them by 2^15
## then outputs the result as a signed 16-bit hex number
function [wn_hex_re,wn_hex_im] = twid_hex(N)
  wn_re = real(twid(N));
  wn_im = imag(twid(N));
  wn_hex_re = dec2hex(mod(wn_re.*2^15, 2^16),3);  # scale by 2^15 and Convert to 16-bit two's complement
  wn_hex_im = dec2hex(mod(wn_im.*2^15, 2^16),3);
endfunction


