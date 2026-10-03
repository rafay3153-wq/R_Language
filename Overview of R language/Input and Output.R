# Part 1: read age and print a message
age <- readline(prompt = "Enter your age: ")
age <- as.integer(age)
print(paste("You are", age, "years old."))
# Part 2: function that adds two numbers and prints the result
add_numbers <- function(n1, n2) {
  result <- n1 + n2
  print(paste("The sum of", n1, "and", n2, "is", result))
}
add_numbers(7, 5)
add_numbers(2.5, 4)