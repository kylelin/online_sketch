#-----------------------------------------------
# Sketching matrix by frequency direction
# Input:
#   row, matrix row
#   ell, sketch size
#   s,   snapshot of previous iteration
# Output:
#   sketch_data, snapshot of current iteration
#-----------------------------------------------

function sketch_data = sketch(row, ell, s)
   sketch_data = s;
   cidx = nzero_idx(sketch_data);
   if cidx <= ell
    sketch_data(cidx,:) = row;
    return;
   elseif cidx > ell
    [U,E,V] = svd(sketch_data,0);
    mid = round(ell/2);
    EE = E ** 2;
    delta = EE(mid,mid);
    EW = eye(size(EE))*delta;

    NE = sqrt(max(EE - EW,0));
    sketch_data = NE * V';
    return;
   end
endfunction
