#### Dimension Reduction using Frequent Direction
Implements [matrix sketching] using octave, two data sets are used for test.
- `handwriting digits`, \in R^{7291 \times 256}, dimension reduction
- `Random data`, instance sketching

If original data set is too large to be loaded onto memory, matrix sketching provides a efficient way for holding only $\ell$ sized data on memory, where $\ell$ << original size $N$.

##### Functions

| Method                | Description  |
| ----------------------| -------------|
| load_digits |  load handwriting digits dataset to memory |
| sketch | [matrix sketching] |
| reduce | dimension reduction |
| nzero_idx | find out index of largest non-zero column from matrix |
| plot_digits | plotting digits onto 2-dimentional space |
| dig_reduction | main script of dimension reduction |
| generate_purchase | generate random data |
| load_purchase | load random data to memory |
| evt_reduction | main script of instance sketching |

##### Dimension reduction

Regarding handwriting digits, there are 10 types of digits, `0,1,2,3,4,5,6,7,8,9`. Therefore, 10 might be a reasonable feature size of dataset. I tried `256, 32, 16, 12, 10, 8` features respectively. The major 2 components plot is shown as the following figure.

![2-dim-digits][digits]

`16` almost makes no difference from `256`(original feature size). From `12` to `8`, it starts losing information due to fewer components could not reconstruct data set well.

If you compare the frequent directions between `16` and `10`, it can also explains that why `16` can outperform `10` for reconstructing data set.

- `16`-components

![16-digits][digit_16]

- `10`-components

![10-digits][digit_10]

##### Instance sketching

[matrix sketching]:http://www.cs.yale.edu/homes/el327/papers/simpleMatrixSketching.pdf
[digits]:figures/digits_12_8.png
[digit_16]:figures/digit_direction_16.png
[digit_10]:figures/digit_direction_10.png
