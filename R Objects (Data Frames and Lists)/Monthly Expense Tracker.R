expenses <- data.frame(
  Category = c("Food", "Transport", "Utilities", "Entertainment"),
  Expense1 = c(300, 80, 120, 60),
  Expense2 = c(250, 95, 130, 40),
  Expense3 = c(320, 70, 110, 90)
)
print(expenses)
expense_summary <- list()
for (i in 1:nrow(expenses)) {
  total <- expenses$Expense1[i] + expenses$Expense2[i] + expenses$Expense3[i]
  expense_summary[[expenses$Category[i]]] <- total
}
print(expense_summary)
