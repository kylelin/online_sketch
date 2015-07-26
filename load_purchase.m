#--------------------------------------
# Load purchase data from file
# Output:
#   purchase_matrix, a matrix \in R^{10000 \times 200}
#   product_matrix, a matrix \in R^{100 \times 200}
#   purchase_label, a label vector indicates product
#--------------------------------------

function [purchase_matrix, product_matrix, purchase_label] = load_purchase()
  purchase_matrix = dlmread('data/purchase.train', ',');
  product_matrix = dlmread('data/product.train', ',');
  purchase_label = dlmread('data/purchase.label', ',');
  return;
endfunction
