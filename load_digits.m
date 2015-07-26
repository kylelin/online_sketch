#--------------------------------------
# Load data from file 
# Output:
#   digit_matrix, a matrix \in R^{7921 \times 256}
#   digit_label,  a column vector of digit labels
#--------------------------------------

function [digit_matrix,digit_label]  = load_digits()
  data = dlmread('data/digits.train', ' ');
  digit_matrix = data(:, 2:257);
  digit_label = data(:, 1);
  return;
endfunction
