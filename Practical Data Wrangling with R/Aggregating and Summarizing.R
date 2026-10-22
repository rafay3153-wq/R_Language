students <- read.csv("students_raw.csv")
courses <- read.csv("courses.csv")
subject_summary <- students %>%
  summarise(
    Math_Mean = mean(Math, na.rm = TRUE),
    Math_Median = median(Math, na.rm = TRUE),
    Math_Min = min(Math, na.rm = TRUE),
    Math_Max = max(Math, na.rm = TRUE),
    Statistics_Mean = mean(Statistics, na.rm = TRUE),
    Statistics_Median = median(Statistics, na.rm = TRUE),
    Programming_Mean = mean(Programming, na.rm = TRUE),
    Programming_Median = median(Programming, na.rm = TRUE)
  )
print(subject_summary)
students %>%
  group_by(Department) %>%
  summarise(
    AverageMath = mean(Math, na.rm = TRUE),
    AverageStatistics = mean(Statistics, na.rm = TRUE),
    AverageProgramming = mean(Programming, na.rm = TRUE),
    .groups = "drop"
  )
students %>%
  group_by(Department) %>%
  summarise(
    StudentCount = n(),
    .groups = "drop"
  )
students_courses <- left_join(
  students,
  courses,
  by = "CourseID"
)
students_courses %>%
  group_by(CourseID, CourseName) %>%
  summarise(
    StudentCount = n(),
    AverageMath = mean(Math, na.rm = TRUE),
    AverageStatistics = mean(Statistics, na.rm = TRUE),
    AverageProgramming = mean(Programming, na.rm = TRUE),
    HighestProgramming = max(Programming, na.rm = TRUE),
    .groups = "drop"
  )
students %>%
  group_by(Department) %>%
  summarise(
    AverageMath = mean(Math, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(AverageMath))
marks
students %>%
  mutate(
    AverageMarks = rowMeans(
      select(., Math, Statistics, Programming),
      na.rm = TRUE
    ),
    Result = ifelse(AverageMarks >= 50, "Pass", "Fail")
  ) %>%
  count(Result)