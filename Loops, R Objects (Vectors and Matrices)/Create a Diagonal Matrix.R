make_diagonal <- function(v) {
  n <- length(v)
  d <- matrix(0, nrow = n, ncol = n) 
  for (i in 1:n) {
    d[i, i] <- v[i] 
  }
  return(d)
}
print(make_diagonal(c(2, 4, 6, 8)))
print(make_diagonal(c(1, 5, 9)))
