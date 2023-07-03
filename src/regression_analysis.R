library('ProjectTemplate')
load.project()

# Specify the file path of the CSV file
file_path <- "data/dataset.csv"

# Read the CSV file
data <- read.csv(file_path)

# Select the variables for regression analysis
x <- data$Age
y <- data$Fare

# Perform linear regression
model <- lm(y ~ x)

# Print the summary of the linear regression model
summary(model)

# Create a scatter plot
png("graphs/regression_scatter_plot.png", width = 800, height = 600) 
plot(x, y, main = "Scatter Plot of Age vs. Fare",
     xlab = "Age", ylab = "Fare", col = "blue", pch = 16)
abline(model, col = "red", lwd=2)
legend("topright", legend = c("Data Points", "Regression Line"),
       col = c("blue", "red"), pch = c(16, NA), lty = c(NA, 1))
dev.off()  # Save the plot and close the graphics device
