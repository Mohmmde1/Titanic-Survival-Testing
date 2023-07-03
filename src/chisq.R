# Read the Titanic data-set
titanic <- read.csv("C:/Users/Devex/Downloads/PSDA/train.csv")

# Create a contingency table of Survived and Sex
table <- table(titanic$Survived, titanic$Sex)

# Perform the Chi-square test of independence
result <- chisq.test(table)

# Print the result
print(result)

# Generate the contingency table
conTable <- table(titanic$Survived, titanic$Sex)

# Print the contingency table
print(conTable)