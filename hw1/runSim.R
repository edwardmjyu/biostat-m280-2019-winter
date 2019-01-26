## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text=arg))
}

## set seed
set.seed(seed)

## check if a given integer is prime
isPrime = function(n) {
  if (n <= 3) {
    return (TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return (FALSE)
  }
  return (TRUE)
}

## estimate mean only using observation with prime indices
estMeanPrimes = function (x) {
  n = length(x)
  ind = sapply(1:n, isPrime)
  return (mean(x[ind]))
}

## Bbject A captures the data generated from the distribution given, and 
## primeavg and sampavg are appended at the end of the object.
A <- replicate(rep, c(if (dist == "gaussian") {
                        x = rnorm(n)
                    } else if (dist == "t1") {
                        x = rt(n, 1)
                    } else if (dist == "t5") {
                        x = rt(n, 5)
                    }, estMeanPrimes(x), mean(x)))

## extracting only values for estMeanPrimes(x) and mean(x)
B <- tail(A,2)

## MSE for primeavg and sampavg
sum(B[1,]^2)/rep #MSEprimeavg
sum(B[2,]^2)/rep #MSEsampavg