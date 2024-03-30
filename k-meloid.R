# Install and load necessary packages
install.packages("cluster")
library(cluster)

# Read the dataset
data <- read.table(text = "
Customer_ID Age Gender Employment_Status Monthly_Balance_INR Loan_Approved Credit_Score
1001 35 Male Employed 375000 Yes 720
1002 28 Female Student 90000 No 650
1003 45 Female Self-employed 562500 Yes 780
1004 40 Male Employed 300000 Yes 710
1005 22 Male Unemployed 0 No 600
1006 39 Female Employed 465000 Yes 730
1007 31 Male Employed 360000 Yes 680
1008 26 Female Unemployed 0 No 620
1009 48 Male Self-employed 600000 Yes 750
1010 29 Female Employed 262500 No 590
1011 33 Male Employed 420000 Yes 700
1012 36 Female Self-employed 520000 Yes 740
1013 27 Female Employed 325000 Yes 680
1014 34 Male Employed 380000 Yes 710
1015 30 Male Unemployed 0 No 580
1016 42 Female Employed 480000 Yes 760
1017 25 Male Student 0 No 620
1018 37 Female Employed 440000 Yes 690
1019 41 Male Self-employed 550000 Yes 730
1020 32 Female Employed 385000 Yes 680
1021 23 Male Unemployed 0 No 550
1022 38 Female Employed 500000 Yes 720
1023 46 Male Self-employed 575000 Yes 790
1024 31 Male Employed 360000 Yes 710
1025 29 Female Employed 262500 No 590
1026 35 Male Employed 375000 Yes 720
1027 28 Female Student 90000 No 650
1028 45 Female Self-employed 562500 Yes 780
1029 40 Male Employed 300000 Yes 710
1030 22 Male Unemployed 0 No 600
1031 39 Female Employed 465000 Yes 730
1032 31 Male Employed 360000 Yes 680
1033 26 Female Unemployed 0 No 620
1034 48 Male Self-employed 600000 Yes 750
1035 29 Female Employed 262500 No 590
1036 33 Male Employed 420000 Yes 700
1037 36 Female Self-employed 520000 Yes 740
1038 27 Female Employed 325000 Yes 680
", header = TRUE)

# Select relevant columns for clustering
clustering_data <- data[, c("Age", "Monthly_Balance_INR", "Credit_Score")]

# Perform K-medoids clustering
kmedoids_result <- pam(clustering_data, k = 3)  # Change k as desired

# Print cluster medoids
print(kmedoids_result$medoids)

# Print cluster memberships
print(kmedoids_result$clustering)
