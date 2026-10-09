x <- seq(-3, 3, by = 0.5)

y <- dnorm(x)

plot(x, y,
     col = "red",
     pch = 19,
     main = "Normal Distribution",
     xlab = "X Values",
     ylab = "Probability Density")
