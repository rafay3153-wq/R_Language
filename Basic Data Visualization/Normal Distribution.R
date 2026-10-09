x <- seq(-3, 3, by = 0.1)

y <- dnorm(x)

plot(x, y,
     type = "l",
     main = "Normal Distribution",
     xlab = "x",
     ylab = "Density")