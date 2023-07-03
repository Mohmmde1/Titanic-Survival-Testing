# Install the required package
install.packages("titanic")

# Load the necessary libraries
library(titanic)
library(ggplot2)

# Load the Titanic training dataset
data("titanic_train")

# Subset the dataset to include only the variables of interest (Survived and Sex)
df <- titanic_train[, c("Survived", "Sex")]

# Perform chi-square test
contingency_table <- table(df$Survived, df$Sex)
chi_square_result <- chisq.test(contingency_table)

# Print the test result
print(chi_square_result)

# Create a bar plot to visualize survival rates by gender
ggplot(data = df, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(x = "Sex", y = "Proportion", fill = "Survived") +
  ggtitle("Survival Rates by Gender")
