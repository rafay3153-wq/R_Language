set.seed(7)
m <- matrix(round(runif(15, 1, 50), 1), nrow = 5, ncol = 3)
print(m)
for (j in 1:ncol(m)) {
  col_total <- 0
  for (i in 1:nrow(m)) {
    col_total <- col_total + m[i, j]
  }
  print(paste("Mean of column", j, "=", col_total / nrow(m)))
}
print(colMeans(m)) 
