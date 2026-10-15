study <- data.frame(
  Study_Hours = c(1, 2, 3, 4, 5, 6, 7, 8),
  Marks = c(45, 50, 55, 65, 68, 75, 82, 90)
)
plot(
study$Study_Hours,
study$Marks,
main = "Study Hours and Examination Marks",
xlab = "Study Hours",
ylab = "Examination Marks",
pch = 19
)
r <- cor(study$Study_Hours, study$Marks)
r
if (r > 0) {
  print("The relationship is positive.")
} else if (r < 0) {
  print("The relationship is negative.")
} else {
  print("There is no linear correlation.")
}
r_squared <- r^2
r_squared
cat("Correlation coefficient:", round(r, 3), "\n")
cat("Coefficient of determination:", round(r_squared, 3), "\n")
cat("Coefficient of determination (%):",
    round(r_squared * 100, 2), "%\n")
