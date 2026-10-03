inventory <- data.frame(
  ProductID = 1:5,
  ProductName = c("Laptop", "Mouse", "Keyboard", "Monitor", "Webcam"),
  Quantity = c(10, 0, 25, 0, 7),
  Price = c(950, 15, 40, 220, 60)
)
print(inventory)
stock_list <- list()
for (i in 1:nrow(inventory)) {
  if (inventory$Quantity[i] > 0) {
    stock_list[[inventory$ProductName[i]]] <- "In Stock"
  } else {
    stock_list[[inventory$ProductName[i]]] <- "Out of Stock"
  }
}
print(stock_list)
