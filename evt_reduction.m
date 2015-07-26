#------------------------------------------------------------------------------------
# Test purchase event reduction by sketch using 'purchase.train' and 'product.train'
#------------------------------------------------------------------------------------

[purchase, product, plabel] = load_purchase();

DIMENSION = size(product,2);
ELL = 20;

figure;
for i = 1 : size(product, 1)
  subplot(2, 5, i);
  imshow(reshape(product(i,:),16,16),[]);
  title(strcat("direction index = ", int2str(i)));
end
print('figures/p_direction_o.png','-dpng','-S800,600');

shrunk_purchase = zeros(20, DIMENSION);
idx = 1;
cidx = 1;

while (cidx <= ELL || idx <= 900)
  shrunk_purchase = sketch(purchase(idx, :), ELL, shrunk_purchase);
  cidx = nzero_idx(shrunk_purchase);
  ++idx;
endwhile

[U_p, S_p, V_p] = svd(shrunk_purchase, 'econ');
figure;
for i = 1 : ELL
  subplot(4, 5, i);
  imshow(reshape(V_p(:,i)',16,16),[]);
  title(strcat("direction index = ", int2str(i)));
end
print('figures/p_direction_20.png','-dpng','-S800,600');

# trivial summary 
[pid, ~, j] = unique(plabel'(1:idx,:));
trivial_result = sortrows([pid,accumarray(j,1)], -2);
