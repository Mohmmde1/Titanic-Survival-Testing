# Install the required package
install.packages("titanic")

# Load the necessary libraries
library(titanic)
library(ggplot2)

# Load the Titanic training dataset
data("titanic_train")

# Subset the dataset to include only the variables of interest (Survived and Pclass)
df <- titanic_train[, c("Survived", "Pclass")]

# Perform chi-square test
contingency_table <- table(df$Survived, df$Pclass)
chi_square_result <- chisq.test(contingency_table)

# Print the test result
print(chi_square_result)

# Create a bar plot to visualize survival rates by passenger class
ggplot(data = df, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(x = "Passenger Class", y = "Proportion", fill = "Survived") +
  ggtitle("Survival Rates by Passenger Class")
