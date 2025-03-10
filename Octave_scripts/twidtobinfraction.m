wn = twid(8);
precision = 12;

wn_real = cell(1,4);  % Preallocate cell arrays for binary strings
wn_img = cell(1,4);
for i = 1:4
  wn_real{i} = decimalToBinaryFraction(real(wn(i)), precision);
  wn_img{i} = decimalToBinaryFraction(imag(wn(i)), precision);
end

wn_real
wn_img
