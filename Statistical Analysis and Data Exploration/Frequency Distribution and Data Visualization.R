language <- c(
  "Python", "R", "Python", "Java", "R",
  "Python", "C++", "Python", "R", "Java",
  "Python", "C++", "R", "Python", "Java",
  "R", "Python", "C++", "Python", "R"
)
frequency <- table(language)
frequency
relative_frequency <- prop.table(frequency)
relative_frequency
percentage <- relative_frequency * 100
round(percentage, 2)
barplot(
  frequency,
  main = "Preferred Programming Languages",
  xlab = "Programming Language",
  ylab = "Number of Students"
)
pie(
  frequency,
  main = "Programming Language Preferences"
)
names(frequency[frequency == max(frequency)])
names(frequency[frequency == min(frequency)])
