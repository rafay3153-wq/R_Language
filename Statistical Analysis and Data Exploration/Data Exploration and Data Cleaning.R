students <- data.frame(
  Student_ID = c(1, 2, 3, 4, 2, 6, 7, 8),
  Study_Hours = c(2, 4, 3, NA, 4, 6, 100, 4),
  Marks = c(55, 70, 65, 60, 70, NA, 95, 72),
  Study_Method = c(
    "Online", "Books", "Online", "Books",
    "Books", "Online", "Online", "Books"
  )
)
head(students)
dim(students)
nrow(students)
ncol(students)
str(students)
summary(students)
colSums(is.na(students))
duplicated(students)
students[duplicated(students), ]
students_clean <- students[!duplicated(students), ]
students_clean
mean(students$Study_Hours, na.rm = TRUE)
boxplot(
  students$Study_Hours,
  main = "Study Hours of Students",
  ylab = "Study Hours"
)
Q1 <- quantile(students$Study_Hours, 0.25, na.rm = TRUE)
Q3 <- quantile(students$Study_Hours, 0.75, na.rm = TRUE)
iqr_value <- IQR(students$Study_Hours, na.rm = TRUE)
lower_limit <- Q1 - 1.5 * iqr_value
upper_limit <- Q3 + 1.5 * iqr_value
students$Study_Hours[
  !is.na(students$Study_Hours) &
    (
      students$Study_Hours < lower_limit |
        students$Study_Hours > upper_limit
    )
]
