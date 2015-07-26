#-----------------------------------------------
# Find out index of largest non-zero column
# Input:
#   sketch, a matrix
# Output:
#   index, a positive integer implies largest non-zero column's index
#-----------------------------------------------

function index = nzero_idx(sketch)
   index = max(find(any(sketch,2) > 0));
   if sum(index) == 0
       index = 1;
   else
       index = index + 1;
   end
   return;
endfunction
