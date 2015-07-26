#----------------------------------------
# Plotting by digit features
# Input:
#   digit_label
#   U, features of digit
#   ell, number of dimensions
#----------------------------------------

function plot_digits(digit_label, U, ell)
  colormap jet; 
  col=colormap;
  for number = 1 : 10
    number_index = find(digit_label == (number - 1));
    text(U(number_index, 1), U(number_index, 2), int2str(number - 1), 'color', col(ceil(size(col, 1) * number/10), :));
  end
  xlim([min(U(:, 1)), max(U(:, 1))]);
  ylim([min(U(:, 2)), max(U(:, 2))]);
  title(strcat("ell=",int2str(ell)));
endfunction
