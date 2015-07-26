#--------------------------------------
# Generate purchase data
# Input: 
#   n, number of purchase instances
#   m, number of products
#   d, dimension of each instances
# Output:
#   purchase_matrix, a matrix \in R^{n \times d}
#   product_matrix, a matrix \in R^{m \times d}
#--------------------------------------

function [purchase_matrix, product_matrix, purchase_label] = generate_purchase(n, m, d)
  PRODUCT_SIZE = m;
  # Generate product matrix \in R^{PRODUCT_SIZE \times d}
  product_matrix = rand(PRODUCT_SIZE, d);

  # Generate purchase matrix using product_matrix
  purchase_matrix = [];
  purchase_label = [];
  for index = 1:n
    product_idx = ceil(rand(1) * PRODUCT_SIZE);
    purchase_matrix = [purchase_matrix; product_matrix(product_idx, :)];
    purchase_label = [purchase_label, product_idx];
  end
  csvwrite('data/product.train', product_matrix);
  csvwrite('data/purchase.train', purchase_matrix);
  csvwrite('data/purchase.label', purchase_label);
endfunction
