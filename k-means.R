# Load necessary libraries
library(ggplot2)
library(cluster)

# Read the dataset
data <- data.frame(
  Customer_ID = c(1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010,
                  1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020,
                  1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030,
                  1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040),
  Age = c(35, 28, 45, 40, 22, 39, 31, 26, 48, 29,
          33, 36, 27, 34, 30, 42, 25, 37, 41, 32,
          23, 38, 46, 31, 29, 35, 28, 45, 40, 22,
          39, 31, 26, 48, 29, 33, 36, 27, 34, 30),
  Gender = c("Male", "Female", "Female", "Male", "Male",
             "Female", "Male", "Female", "Male", "Female",
             "Male", "Female", "Female", "Male", "Male", 
             "Female", "Male", "Female", "Male", "Female",
             "Male", "Female", "Male", "Male", "Female",
             "Male", "Female", "Female", "Male", "Male",
             "Female", "Male", "Female", "Male", "Female",
             "Male", "Female", "Female", "Male", "Male"),
  Employment_Status = c("Employed", "Student", "Self-employed", "Employed", "Unemployed",
                        "Employed", "Employed", "Unemployed", "Self-employed", "Employed",
                        "Employed", "Self-employed", "Employed", "Employed", "Unemployed",
                        "Employed", "Student", "Employed", "Self-employed", "Employed",
                        "Unemployed", "Employed", "Self-employed", "Employed", "Employed",
                        "Employed", "Student", "Self-employed", "Employed", "Employed",
                        "Unemployed", "Employed", "Employed", "Self-employed", "Employed",
                        "Employed", "Self-employed", "Employed", "Employed", "Unemployed"),
  Monthly_Balance_INR = c(375000, 90000, 562500, 300000, 0,
                          465000, 360000, 0, 600000, 262500,
                          420000, 520000, 325000, 380000, 0,
                          480000, 0, 440000, 550000, 385000,
                          0, 500000, 575000, 360000, 262500,
                          375000, 90000, 562500, 300000, 0,
                          465000, 360000, 0, 600000, 262500,
                          420000, 520000, 325000, 380000, 0),
  Loan_Approved = c("Yes", "No", "Yes", "Yes", "No",
                    "Yes", "Yes", "No", "Yes", "No",
                    "Yes", "Yes", "Yes", "Yes", "No",
                    "Yes", "No", "Yes", "Yes", "Yes",
                    "No", "Yes", "Yes", "Yes", "No",
                    "Yes", "No", "Yes", "Yes", "No",
                    "Yes", "Yes", "Yes", "Yes", "No",
                    "Yes", "Yes", "Yes", "Yes", "No"),
  Credit_Score = c(720, 650, 780, 710, 600,
                   730, 680, 620, 750, 590,
                   700, 740, 680, 710, 580,
                   760, 620, 690, 730, 680,
                   550, 720, 790, 710, 590,
                   720, 650, 780, 710, 600,
                   730, 680, 620, 750, 590,
                   700, 740, 680, 710, 580)
)

# Select relevant columns for clustering
clustering_data <- data[, c("Age", "Monthly_Balance_INR", "Credit_Score")]

# Standardize the data
scaled_data <- scale(clustering_data)

# Calculate the sum of squared distances for different values of K
wss <- (nrow(scaled_data) - 1) * sum(apply(scaled_data, 2, var))
for (i in 1:10) {
  wss[i] <- sum(kmeans(scaled_data, centers = i)$withinss)
}

# Plot the elbow curve
ggplot() +
  geom_line(aes(x = 1:10, y = wss), color = "blue") +
  labs(title = "Elbow Method for Optimal K",
       x = "Number of Clusters (K)",
       y = "Within-cluster Sum of Squares (WSS)") +
  theme_minimal()
