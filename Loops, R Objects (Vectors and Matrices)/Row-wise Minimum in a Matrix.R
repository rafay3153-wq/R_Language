set.seed(5)
m <- matrix(round(runif(16, 1, 100)), nrow = 4)
print(m)
for (i in 1:nrow(m)) {
  row_min <- m[i, 1]
  for (j in 2:ncol(m)) {
    if (m[i, j] < row_min) {
      row_min <- m[i, j]
    }
  }
  print(paste("Minimum of row", i, "=", row_min))
}

