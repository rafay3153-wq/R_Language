students_raw <- data.frame(
  StudentID = c(101, 102, 103, 104, 105, 106, 106, 107),
  Name = c(
    " Ali ", "Sara", "Ahmed", "Ayesha ",
    "Bilal", "Fatima", "Fatima", "Usman"
  ),
  Age = c(20, 21, 19, NA, 22, 20, 20, -5),
  Department = c(
    "Data Science", "data science", "Computer Science",
    "Data Science", "Computer Science", "Data Science",
    "Data Science", "Computer Science"
  ),
  CourseID = c("C01", "C02", "C01", "C03", "C02", "C01", "C01", 
               "C04"),
  Math = c(78, 85, 90, 67, NA, 88, 88, 75),
  Statistics = c(82, 79, 95, 72, 80, NA, NA, 81),
  Programming = c(80, 88, 92, 70, 76, 91, 91, 500),
  stringsAsFactors = FALSE
)
courses <- data.frame(
  CourseID = c("C01", "C02", "C03"),
  CourseName = c(
    "Statistics for Data Science",
    "Programming Fundamentals",
    "Data Visualization"
  ),
  CreditHours = c(3, 4, 3)
)
write.csv(students_raw, "students_raw.csv", row.names = FALSE)
write.csv(courses, "courses.csv", row.names = FALSE)
