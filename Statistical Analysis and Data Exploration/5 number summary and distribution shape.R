processing_time <- c(12, 14, 15, 16, 17, 18, 19, 20, 22, 25, 60)
summary(processing_time)
quantile(processing_time)
boxplot(
  processing_time,
  main = "Program Processing Time",
  ylab = "Time in Seconds"
)
Q1 <- quantile(processing_time, 0.25)
Q3 <- quantile(processing_time, 0.75)
iqr_value <- IQR(processing_time)
lower_limit <- Q1 - 1.5 * iqr_value
upper_limit <- Q3 + 1.5 * iqr_value
lower_limit
upper_limit
processing_time[
  processing_time < lower_limit |
    processing_time > upper_limit
]
skewness(processing_time)
kurtosis(processing_time)
mean(processing_time)
median(processing_time)
