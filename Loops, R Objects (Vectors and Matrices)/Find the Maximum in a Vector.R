set.seed(42)
v <- round(runif(20, min = 1, max = 100), 2)
print(v)
max_value <- v[1] # start with the first element
for (i in 2:length(v)) {
  if (v[i] > max_value) {
    max_value <- v[i]
  }
}
print(paste("Maximum value (loop):", max_value))
print(paste("Check with max():", max(v)))

