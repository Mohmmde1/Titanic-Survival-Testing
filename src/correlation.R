# Load the required library for plotting
library(ggplot2)

# Load the dataset
dataset <- read.csv(file.path(getwd(), 'data', 'dataset.csv'))

# Remove rows with null values
filtered_dataset <- dataset[complete.cases(dataset$Age, dataset$SibSp), ]

# Assign the relevant variables to the 'Variable1' and 'Variable2' variables
Variable1 <- filtered_dataset$Age
Variable2 <- filtered_dataset$SibSp

# Create a scatter plot
ggplot(data = filtered_dataset, aes(x = Variable1, y = Variable2)) +
  geom_point() +
  labs(x = "Age", y = "SibSp") +
  ggtitle("Scatter Plot of Age and SibSp")

# Calculate the correlation coefficient
correlation_coefficient <- cor(Variable1, Variable2, method = "pearson")

# Compute the test statistic and critical values
n <- length(Variable1)  # Number of observations
degrees_of_freedom <- n - 2  # Degrees of freedom for a two-variable correlation
critical_value <- qt(0.975, df = degrees_of_freedom)  # Two-tailed critical value at 0.05 significance level

# Calculate the test statistic
test_statistic <- correlation_coefficient * sqrt((1 - correlation_coefficient^2) / (n - 2))

# Print the correlation coefficient, test statistic, and critical values
cat("Correlation Coefficient:", correlation_coefficient, "\n")
cat("Test Statistic:", test_statistic, "\n")
cat("Critical Values (", degrees_of_freedom, " degrees of freedom):", -critical_value, "and", critical_value, "\n")

# Interpret the results based on the correlation coefficient and critical values
if (abs(test_statistic) > critical_value) {
  cat("The correlation between Age and SibSp is statistically significant.\n")
  if (correlation_coefficient > 0) {
    cat("There is a positive correlation between Age and SibSp.\n")
  } else {
    cat("There is a negative correlation between Age and SibSp.\n")
  }
} else {
  cat("The correlation between Age and SibSp is not statistically significant.\n")
}
