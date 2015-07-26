#-------------------------------------------
# Conduct dimension reduction by sketch
# Input:
#   ELL, new dimension size
#   digit_label
#   digit_matrix_norm
#   U,   original features
# Output:
#   S, snapshot of final sketch
#   F, new features
#-------------------------------------------

function [S, F] = reduce(ELL, digit_label, digit_matrix_norm, U)
  S = zeros(ELL, 256);
  for idx = 1 : size(digit_label, 1)
    S = sketch(digit_matrix_norm(idx,:), ELL, S);
  end

  [U_p, S_p, V_p] = svd(S', 'econ');
  F = digit_matrix_norm * U_p;

  if F(:,1)' * U(:,1) < 0
    F(:,1) = (-1) * F(:,1);
  end
  if F(:,2)' * U(:,2) < 0
    F(:,2) = (-1) * F(:,2);
  end
endfunction
