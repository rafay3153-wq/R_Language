# STEP 1: DISCOVERY AND EXPLORATION
students_raw <- read.csv("students_raw.csv")
head(students_raw)
str(students_raw)
summary(students_raw)
cat("Rows:", nrow(students_raw), "\n")
cat("Columns:", ncol(students_raw), "\n")
cat("Total missing values:", sum(is.na(students_raw)), "\n")
cat("Duplicate rows:", sum(duplicated(students_raw)), "\n")
print(colSums(is.na(students_raw)))
students_raw %>%
  filter(Age < 0 | Math < 0 | Math > 100 |
           Statistics < 0 | Statistics > 100 |
           Programming < 0 | Programming > 100)
# STEP 2: IMPORT BOTH FILES
students <- readr::read_csv("students_raw.csv")
courses <- readr::read_csv("courses.csv")
# STEP 3: STRUCTURING AND RESHAPING
marks_long <- students %>%
  pivot_longer(
    cols = c(Math, Statistics, Programming),
    names_to = "Subject",
    values_to = "Marks"
  )
print(marks_long)
# STEP 4: CLEANING AND TRANSFORMING
students_clean <- students %>%
  distinct()
students_clean <- students_clean %>%
  mutate(
    Name = trimws(Name),
    Department = trimws(Department)
  )
students_clean <- students_clean %>%
  mutate(
    Department = case_when(
      tolower(Department) == "data science" ~ "Data Science",
      tolower(Department) == "computer science" ~ "Computer Science",
      TRUE ~ Department
    )
  )
students_clean <- students_clean %>%
  mutate(
    Age = ifelse(Age < 0, NA, Age)
  )
age_median <- median(students_clean$Age, na.rm = TRUE)
students_clean$Age[
  is.na(students_clean$Age)
] <- age_median
students_clean <- students_clean %>%
  mutate(
    Math = ifelse(Math < 0 | Math > 100, NA, Math),
    Statistics = ifelse(
      Statistics < 0 | Statistics > 100, NA, Statistics
    ),
    Programming = ifelse(
      Programming < 0 | Programming > 100, NA, Programming
    )
  )
math_mean <- mean(students_clean$Math, na.rm = TRUE)
statistics_mean <- mean(students_clean$Statistics, na.rm = TRUE)
programming_mean <- mean(students_clean$Programming, na.rm = TRUE)
students_clean$Math[
  is.na(students_clean$Math)
] <- math_mean
students_clean$Statistics[
  is.na(students_clean$Statistics)
] <- statistics_mean
students_clean$Programming[
  is.na(students_clean$Programming)
] <- programming_mean
students_clean <- students_clean %>%
  mutate(
    AverageMarks = rowMeans(
      select(., Math, Statistics, Programming)
    ),
    Programming_Normalized =
      (Programming - min(Programming)) /
      (max(Programming) - min(Programming)),
    Result = ifelse(AverageMarks >= 50, "Pass", "Fail")
  )
# STEP 5: ENRICHING AND JOINING
students_enriched <- students_clean %>%
  left_join(courses, by = "CourseID")
print(students_enriched)
unmatched_courses <- anti_join(
  students_clean,
  courses,
  by = "CourseID"
)
print(unmatched_courses)
# STEP 6: AGGREGATING AND SUMMARIZING
department_report <- students_enriched %>%
  group_by(Department) %>%
  summarise(
    StudentCount = n(),
    AverageMath = mean(Math),
    AverageStatistics = mean(Statistics),
    AverageProgramming = mean(Programming),
    AverageOverall = mean(AverageMarks),
    .groups = "drop"
  ) %>%
  arrange(desc(AverageOverall))
print(department_report)
course_report <- students_enriched %>%
  group_by(CourseID, CourseName, CreditHours) %>%
  summarise(
    StudentCount = n(),
    AverageMath = mean(Math),
    AverageStatistics = mean(Statistics),
    AverageProgramming = mean(Programming),
    AverageOverall = mean(AverageMarks),
    .groups = "drop"
  ) %>%
  arrange(desc(AverageOverall))
print(course_report)
result_report <- students_enriched %>%
  count(Result)
print(result_report)
write.csv(
  students_enriched,
  "students_cleaned_enriched.csv",
  row.names = FALSE
)
write.csv(
  department_report,
  "department_report.csv",
  row.names = FALSE
)
write.csv(
  course_report,
  "course_report.csv",
  row.names = FALSE
)
