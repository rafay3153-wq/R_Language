set.seed(123)
scores_A <- rnorm(1000, mean = 70, sd = 10)
scores_B <- c(scores_A[1:999], 150)
mean(scores_A)
sd(scores_A)
mean(scores_B)
sd(scores_B)
mean_A <- mean(scores_A)
sd_A <- sd(scores_A)
within_1_sd <- mean(
  scores_A >= mean_A - sd_A &
    scores_A <= mean_A + sd_A
) * 100
within_2_sd <- mean(
  scores_A >= mean_A - 2 * sd_A &
    scores_A <= mean_A + 2 * sd_A
) * 100
within_3_sd <- mean(
  scores_A >= mean_A - 3 * sd_A &
    scores_A <= mean_A + 3 * sd_A
) * 100
within_1_sd
within_2_sd
within_3_sd
cat("Within 1 SD:", round(within_1_sd, 2), "%; expected about 68%\n")
cat("Within 2 SDs:", round(within_2_sd, 2), "%; expected about 95%\n")
cat("Within 3 SDs:", round(within_3_sd, 2), "%; expected about 99.7%\n")
hist(
  scores_A,
  main = "Distribution of Scores A",
  xlab = "Scores"
)
hist(
  scores_B,
  main = "Distribution of Scores B",
  xlab = "Scores"
)
boxplot(
  scores_A, scores_B,
  names = c("Scores A", "Scores B"),
  main = "Comparison of Examination Scores"
)
