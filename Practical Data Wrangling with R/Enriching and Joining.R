students <- read.csv("students_raw.csv")
courses <- read.csv("courses.csv")
students_courses <- left_join(
  students,
  courses,
  by = "CourseID"
)
print(students_courses)
students_courses %>%
  select(StudentID, Name, CourseID, CourseName, CreditHours)
students_inner <- inner_join(
  students,
  courses,
  by = "CourseID"
)
print(students_inner)
unmatched_students <- anti_join(
  students,
  courses,
  by = "CourseID"
)
print(unmatched_students)
students_courses %>%
  group_by(CourseID, CourseName) %>%
  summarise(
    NumberOfStudents = n(),
    .groups = "drop"
  )

