#-----------------------------------------------------------------
# Test digits reduction by sketch using 'digits.train'
#-----------------------------------------------------------------

[digit_matrix, digit_label] = load_digits();

# Normalize digits matrix
mean_digits = mean(digit_matrix, 1);
digit_matrix_norm = bsxfun(@minus, digit_matrix, mean_digits);

[U_o, S_o, V_o] = svd(digit_matrix_norm, 'econ');

# Sketching 

ELL = 32;
[S_32, F_32] = reduce(ELL, digit_label, digit_matrix_norm, U_o);

ELL = 16;
[S_16, F_16] = reduce(ELL, digit_label, digit_matrix_norm, U_o);

ELL = 12;
[S_12, F_12] = reduce(ELL, digit_label, digit_matrix_norm, U_o);

ELL = 10;
[S_10, F_10] = reduce(ELL, digit_label, digit_matrix_norm, U_o);

ELL = 8;
[S_8, F_8] = reduce(ELL, digit_label, digit_matrix_norm, U_o);

return

# plotting frequency directions 
figure;
for i = 1 : 12
  subplot(3,4,i);
  [u, ~, ~] = svd(S_12', 'econ');
  imshow(reshape(u(:,i)',16,16),[]);
  title(strcat("direction index = ", int2str(i)));
end
print('figures/digit_direction_12.png','-dpng','-S800,600');

figure;
for i = 1 : 10
  subplot(3,4,i);
  [u, ~, ~] = svd(S_10', 'econ');
  imshow(reshape(u(:,i)',16,16),[]);
  title(strcat("direction index = ", int2str(i)));
end
print('figures/digit_direction_10.png','-dpng','-S800,600');

# plotting frequency directions 
figure;
for i = 1 : 16
  subplot(4,4,i);
  [u, ~, ~] = svd(S_16', 'econ');
  imshow(reshape(u(:,i)',16,16),[]);
  title(strcat("direction index = ", int2str(i)));
end
print('figures/digit_direction_16.png','-dpng','-S800,600');

return

# Plotting distribution 

subplot(2,3,1);
plot_digits(digit_label, U_o, 256);

subplot(2,3,2);
plot_digits(digit_label, F_32, 32);

subplot(2,3,3);
plot_digits(digit_label, F_16, 16);

subplot(2,3,4);
plot_digits(digit_label, F_12, 12);

subplot(2,3,5);
plot_digits(digit_label, F_10, 10);

subplot(2,3,6);
plot_digits(digit_label, F_8, 8);

print('figures/digits_12_8.png','-dpng','-S1200,800');
