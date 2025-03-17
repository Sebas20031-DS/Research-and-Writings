# Load the necessary library for Correspondence Analysis
library(FactoMineR)
library(factoextra)

# Data for Men
y1 <- c(15,17,15,13,20,15,15,13,14,17,17,17,15,18,18,15,18,10,18,18,13,16,11,16,16,18,16,15,18,18,17,19)
y2 <- c(17,15,14,12,17,21,13,5 ,7 ,15,17,20,15,19,18,14,17,14,21,21,17,16,15,13,13,18,15,16,19,16,20,19)
y3 <- c(24,32,29,10,26,26,26,22,30,30,26,28,29,32,31,26,33,19,30,34,30,16,25,26,23,34,28,29,32,33,21,30)
y4 <- c(14,26,23,16,28,21,22,22,17,27,20,24,24,28,27,21,26,17,29,26,24,16,23,16,21,24,27,24,23,7 ,21,28)

#Creating a matrix for Men's data
data_men <- matrix(c(y1, y2, y3, y4), ncol = 4)
colnames(data_men) <- c("y1", "y2", "y3", "y4")

# Data for Women
y1 <- c(13,14,12,12,11,12,10,10,12,11,12,14,14,13,14,13,16,14,16,13,2 ,14,17,16,15,12,14,13,11,7 ,12,6 )
y2 <- c(14,12,19,13,20,9 ,13,8 ,20,10,18,18,10,16,8 ,16,21,17,16,16,6 ,16,17,13,14,10,17,15,16,7 ,15,5 )
y3 <- c(12,14,21,10,16,14,18,13,19,11,25,13,25,8 ,13,23,26,14,15,23,16,22,22,16,20,12,24,18,18,19,7 ,6 )
y4 <- c(21,26,21,16,16,18,24,23,23,27,25,26,28,14,25,28,26,14,23,24,21,26,28,14,26,9 ,23,20,28,18,28,13)

# Creating a matrix for Women's data
data_women <- matrix(c(y1, y2, y3, y4), ncol = 4)
colnames(data_women) <- c("y1", "y2", "y3", "y4")


# PCA for Men -------------------------------------------------------------

# Compute covariance matrix
S_men <- cov(data_men)

# Perform Singular Value Decomposition (SVD) and Eigenvalue decomposition
desc1_men <- svd(S_men)
desc2_men <- eigen(S_men)

# Perform Principal Component Analysis (PCA) for Men's data
pca_men <- FactoMineR::PCA(data_men, scale.unit = TRUE, graph = TRUE)

# Check the eigenvalues to decide how many components to keep
pca_men$eig

# Scree plot to visualize the eigenvalues
factoextra::fviz_screeplot(pca_men, addlabels = TRUE)

# Perform parallel analysis to confirm the number of components
paran::paran(data_men, iterations = 5000, graph = TRUE)

# Correlation of variables with components
pca_men$var$cor

# Contribution of each variable to the first component
factoextra::fviz_contrib(pca_men, choice = "var", axes = 1)

# Visualizations of PCA results
factoextra::fviz_pca_var(pca_men, repel = TRUE)
factoextra::fviz_pca_ind(pca_men, labelsize = 3, repel = TRUE)
factoextra::fviz_pca_biplot(pca_men, labelsize = 3, repel = TRUE)

# PCA for Women -------------------------------------------------------------

# Compute covariance matrix
S_women <- cov(data_women)

# Perform Singular Value Decomposition (SVD) and Eigenvalue decomposition
desc1_women <- svd(S_women)
desc2_women <- eigen(S_women)

# Perform Principal Component Analysis (PCA) for Women's data
pca_women <- FactoMineR::PCA(data_women, scale.unit = TRUE, graph = TRUE)

# Check the eigenvalues to decide how many components to keep
pca_women$eig

# Scree plot to visualize the eigenvalues
factoextra::fviz_screeplot(pca_women, addlabels = TRUE)

# Perform parallel analysis to confirm the number of components
paran::paran(data_women, iterations = 5000, graph = TRUE)

# Correlation of variables with components
pca_women$var$cor

# Contribution of each variable to the first component
factoextra::fviz_contrib(pca_women, choice = "var", axes = 1)

# Visualizations of PCA results
factoextra::fviz_pca_var(pca_women, repel = TRUE)
factoextra::fviz_pca_ind(pca_women, labelsize = 3, repel = TRUE)
factoextra::fviz_pca_biplot(pca_women, labelsize = 3, repel = TRUE)


# Correspondence Analysis --------------------------------------------


# Data for Men
men_data <- data.frame(
  Age_Group = c("<12", "12-14", "15-17", "18-20", "21-29", "30-39", "40-49", "50-64", "65+"),
  Clothing = c(81, 138, 304, 384, 942, 359, 178, 137, 45),
  Clothing_Accessories = c(66, 204, 193, 149, 297, 109, 53, 68, 28),
  Provisions_Tobacco = c(150, 340, 229, 151, 313, 136, 121, 171, 145),
  Writing_Materials = c(667, 1409, 527, 84, 92, 36, 36, 37, 17),
  Books = c(67, 259, 258, 146, 251, 96, 48, 56, 41),
  Records = c(24, 272, 368, 141, 167, 67, 29, 27, 7),
  Household_Goods = c(47, 117, 98, 61, 193, 75, 50, 55, 29),
  Sweets = c(430, 637, 246, 40, 30, 11, 5, 17, 28),
  Toys = c(743, 684, 116, 13, 16, 16, 6, 3, 8),
  Jewelry = c(132, 408, 298, 71, 130, 31, 14, 11, 10),
  Perfume = c(32, 57, 61, 52, 111, 54, 41, 50, 28),
  Hobbies_Tools = c(197, 547, 402, 138, 280, 200, 152, 211, 111),
  Other = c(209, 550, 454, 252, 624, 195, 88, 90, 34),
  Total = c(2845, 5622, 3554, 1682, 3446, 1385, 821, 933, 531)
)

# View the first few records of the data
head(men_data)

# Data for Women
women_data <- data.frame( 
  Age_Group = c("<12", "12-14", "15-17", "18-20", "21-29", "30-39", "40-49", "50-64", "65+"),
  Clothing = c(71, 241, 477, 436, 1180, 1009, 517, 488, 173),
  Clothing_Accessories = c(19, 98, 114, 108, 207, 165, 102, 127, 64),
  Provisions_Tobacco = c(59, 111, 58, 76, 132, 121, 93, 214, 215),
  Writing_Materials = c(224, 346, 91, 18, 30, 27, 23, 27, 13),
  Books = c(19, 60, 50, 32, 61, 43, 31, 57, 44),
  Records = c(7, 32, 27, 12, 21, 9, 7, 13, 0),
  Household_Goods = c(22, 29, 41, 32, 65, 74, 51, 79, 39),
  Sweets = c(137, 240, 80, 12, 16, 14, 10, 23, 42),
  Toys = c(113, 98, 14, 10, 12, 31, 8, 17, 6),
  Jewelry = c(162, 548, 303, 74, 100, 48, 22, 26, 12),
  Perfume = c(70, 178, 141, 70, 104, 81, 46, 69, 41),
  Hobbies_Tools = c(15, 29, 9, 14, 30, 36, 24, 35, 11),
  Other = c(24, 58, 72, 67, 157, 107, 66, 64, 55),
  Total = c(942, 2068, 1477, 961, 2115, 1765, 1000, 1239, 715)
)

# View the first few records of the data
head(women_data)

# Perform Correspondence Analysis (CA) for Men data
ca_men <- CA(men_data[, -1], graph = TRUE) # Removing Age_Group column, as it is categorical

# Summary of the CA results for Men
summary(ca_men)

# Visualize the Correspondence Analysis
factoextra::fviz_ca_biplot(ca_men, repel = TRUE, 
                           title = "Correspondence Analysis - Men")

factoextra::fviz_ca_row(ca_men, repel = TRUE, 
                        title = "Row Coordinates (Men's Categories)")

factoextra::fviz_ca_col(ca_men, repel = TRUE, 
                        title = "Column Coordinates (Men's Categories)")

# --------------------------------------------------------
# Correspondence Analysis for Women
# --------------------------------------------------------

# Perform Correspondence Analysis (CA) for Women data
ca_women <- CA(women_data[, -1], graph = TRUE) # Removing Age_Group column, as it is categorical

# Summary of the CA results for Women
summary(ca_women)

# Visualize the Correspondence Analysis
factoextra::fviz_ca_biplot(ca_women, repel = TRUE, 
                           title = "Correspondence Analysis - Women")

factoextra::fviz_ca_row(ca_women, repel = TRUE, 
                        title = "Row Coordinates (Women's Categories)")

factoextra::fviz_ca_col(ca_women, repel = TRUE, 
                        title = "Column Coordinates (Women's Categories)")

# --------------------------------------------------------
# Combined Correspondence Analysis (Both Men and Women)
# --------------------------------------------------------

# Combine Men's and Women's data
combined_data <- data.frame(
  Age_Group = c(men_data$Age_Group, women_data$Age_Group),
  Clothing = c(men_data$Clothing, women_data$Clothing),
  Clothing_Accessories = c(men_data$Clothing_Accessories, women_data$Clothing_Accessories),
  Provisions_Tobacco = c(men_data$Provisions_Tobacco, women_data$Provisions_Tobacco),
  Writing_Materials = c(men_data$Writing_Materials, women_data$Writing_Materials),
  Books = c(men_data$Books, women_data$Books),
  Records = c(men_data$Records, women_data$Records),
  Household_Goods = c(men_data$Household_Goods, women_data$Household_Goods),
  Sweets = c(men_data$Sweets, women_data$Sweets),
  Toys = c(men_data$Toys, women_data$Toys),
  Jewelry = c(men_data$Jewelry, women_data$Jewelry),
  Perfume = c(men_data$Perfume, women_data$Perfume),
  Hobbies_Tools = c(men_data$Hobbies_Tools, women_data$Hobbies_Tools),
  Other = c(men_data$Other, women_data$Other),
  Total = c(men_data$Total, women_data$Total)
)

# Perform Correspondence Analysis (CA) for the combined data
ca_combined <- CA(combined_data[, -1], graph = TRUE) # Removing Age_Group column

# Summary of the CA results for Combined data
summary(ca_combined)

# Visualize the Correspondence Analysis
factoextra::fviz_ca_biplot(ca_combined, repel = TRUE, 
                           title = "Correspondence Analysis - Combined")

factoextra::fviz_ca_row(ca_combined, repel = TRUE, 
                        title = "Row Coordinates (Combined Categories)")

factoextra::fviz_ca_col(ca_combined, repel = TRUE, 
                        title = "Column Coordinates (Combined Categories)")



