staff <- data.frame(
  EmployeeID = 1:5,
  Name = c("Bilal", "Nadia", "Omar", "Fatima", "Zain"),
  Age = c(24, 41, 58, 35, 19)
)
print(staff)
age_groups <- list()
for (i in 1:nrow(staff)) {
  if (staff$Age[i] >= 56) {
    group <- "Senior"
  } else if (staff$Age[i] >= 36) {
    group <- "Middle-aged"
  } else {
    group <- "Young"
  }
  age_groups[[staff$Name[i]]] <- group
}
print(age_groups)