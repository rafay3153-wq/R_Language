customers <- data.frame(
  CustomerID = 1:4,
  Name = c("Ali", "Sara", "Hamza", "Ayesha"),
  Purchase1 = c(120, 80, 45, 200),
  Purchase2 = c(60, 150, 90, 35),
  Purchase3 = c(30, 20, 110, 75)
)
customers$Total <- rowSums(customers[, c("Purchase1", "Purchase2", "Purchase3")])
print(customers)
total_list <- list()
for (i in 1:nrow(customers)) {
  total_list[[customers$Name[i]]] <- customers$Total[i]
}
print(total_list)
