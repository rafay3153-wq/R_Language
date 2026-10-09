x <- seq(-3, 3, by = 0.1)

y <- dnorm(x)

plot(x, y,
     type = "l",
     lwd = 5,
     col = "red",
     main = "Standard Normal Distribution",
     xlab = "X Values",
     ylab = "Probability Density")