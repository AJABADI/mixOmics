data("nutrimouse")
set.seed(42)
nrepeat <- 5
tune.spca.res <- tune.spca(
    X = nutrimouse$lipid,
    ncomp = 2,
    nrepeat = nrepeat,
    folds = 3,
    test.keepX = seq(5, 15, 5)
)
tune.spca.res
plot(tune.spca.res)
\dontrun{
## parallel processing using BiocParallel on repeats with more workers (cpus)
## You can use BiocParallel::MulticoreParam() on non_Windows machines 
## for faster computation
BPPARAM <- BiocParallel::SnowParam(workers = max(parallel::detectCores()-1, 2))
tune.spca.res <- tune.spca(
    X = nutrimouse$lipid,
    ncomp = 2,
    nrepeat = nrepeat,
    folds = 3,
    test.keepX = seq(5, 15, 5),
    BPPARAM = BPPARAM
)
plot(tune.spca.res)
}
