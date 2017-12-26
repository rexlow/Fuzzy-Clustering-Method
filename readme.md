# Fuzzy Clustering Method

## To run
* Point MATLAB working directory to this folder.

Define two initial cluster centres.

`Cts = [0.5 0.5; 0.8 0.8]`

Define a fuzziness exponent.

`q = 2`

Clustering is now a matter of iteration.

`[Cts, M] = defcm(Cts,q)`

You should see a plot with the data, and a membership matrix on the Matlab command line. Iterate the above command and watch the plot changes. The closer q is to 1, the more crisp the partitions. It cannot be 1, because q-1 occurs in a denominator, but close to 1 is good enough.

For more information, type
`help defcm`