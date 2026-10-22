students <- read.csv("students_raw.csv")
students <- students %>%
  distinct()
students$Name <- trimws(students$Name)
students$Department <- trimws(students$Department)
students$Department[
  tolower(students$Department) == "data science"
] <- "Data Science"
students$Department[
  tolower(students$Department) == "computer science"
] <- "Computer Science"
students$Math[is.na(students$Math)] <-
  mean(students$Math, na.rm = TRUE)
students$Statistics[is.na(students$Statistics)] <-
  mean(students$Statistics, na.rm = TRUE)
students$Age[students$Age < 0] <- NA
valid_age_median <- median(students$Age, na.rm = TRUE)
students$Age[is.na(students$Age)] <- valid_age_median
students$Programming[
  students$Programming < 0 | students$Programming > 100
] <- NA
programming_median <- median(students$Programming, na.rm = TRUE)
students$Programming[is.na(students$Programming)] <-
  programming_median
students <- students %>%
  mutate(
    AverageMarks = rowMeans(
      select(., Math, Statistics, Programming),
      na.rm = TRUE
    )
  )
students <- students %>%
  mutate(
    Result = ifelse(AverageMarks >= 50, "Pass", "Fail")
  )
students <- students %>%
  mutate(
    Programming_Normalized =
      (Programming - min(Programming)) /
      (max(Programming) - min(Programming))
  )
students$Programming_ZScore <- as.numeric(
  scale(students$Programming)
)
print(students)
summary(students)
values <- c(10, 100, 1000)
log_values <- log10(values)
print(log_values)
counts <- c(4, 9, 16)
sqrt_values <- sqrt(counts)
print(sqrt_values)
values <- c(50, 60, 70)
z_scores <- scale(values)
print(z_scores)
values <- c(10, 20, 30, 40, 50)
normalized_values <-
  (values - min(values)) / (max(values) - min(values))
print(normalized_values)
