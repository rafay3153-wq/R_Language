students <- read.csv("students_raw.csv")
student_marks <- students %>%
  select(StudentID, Name, Math, Statistics, Programming)
marks_long <- student_marks %>%
  pivot_longer(
    cols = c(Math, Statistics, Programming),
    names_to = "Subject",
    values_to = "Marks"
  )
print(marks_long)
marks_wide <- marks_long %>%
  pivot_wider(
    names_from = Subject,
    values_from = Marks
  )
print(marks_wide)
students_renamed <- students %>%
  rename(StudentName = Name)
head(students_renamed)
