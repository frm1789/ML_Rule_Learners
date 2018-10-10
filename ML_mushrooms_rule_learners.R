library(RWeka)

# Step 1: Get the data
f <-file("https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data", open="r")
mushroom <- read.table(f, sep=",", header=F)
str(mushroom)

# Step 2: Exploring and preparing the data
table(mushroom$V11)
# e    t 
# 3516 4608 

# Step 3: Training a model on the data
mushroom_1R <- OneR(V11 ~ ., data = mushroom)
# (6132/8124 instances correct)


# Step 4: Evaluating model performance 
summary(mushroom_1R)
 
# === Summary ===
#   
# Correctly Classified Instances                    6132               75.4801 %
# Incorrectly Classified Instances                  1992               24.5199 %
# Kappa statistic                          0.4994
# Mean absolute error                      0.2452
# Root mean squared error                  0.4952
# Relative absolute error                 49.942  %
# Root relative squared error             99.9422 %
# Total Number of Instances                         8124     
# 
# === Confusion Matrix ===
#   
#   a    b   <-- classified as
# 2484 1032 |    a = e
# 960  3648 |    b = t


# Step 5 – improving model performance
mushroom_JRip <- JRip(V11 ~ ., data = mushroom)

# Step 6: Evaluating improving model performance
# summary(mushroom_JRip)
# === Summary ===
#   
#   Correctly Classified Instances        8124              100      %
# Incorrectly Classified Instances         0                0        %
# Kappa statistic                          1     
# Mean absolute error                      0     
# Root mean squared error                  0     
# Relative absolute error                  0      %
# Root relative squared error              0      %
# Total Number of Instances             8124     
# 
# === Confusion Matrix ===
#   
#   a     b     <-- classified as
# 3516    0     |    a = e
# 0       4608  |    b = t 
# 
