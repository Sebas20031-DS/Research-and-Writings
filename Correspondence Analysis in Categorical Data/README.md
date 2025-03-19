# Correspondence Analysis in Categorical Data

### Overview

This repository contains the analysis and code for a Correspondence Analysis (CA) study conducted on categorical data segmented by gender and age groups. The analysis includes:

- Principal Component Analysis (PCA) for men and women
- Correspondence Analysis (CA) for men and women
- Joint Correspondence Analysis to observe general patterns

### Report

The full report, written in English or Spanish, provides a detailed explanation of the analysis, results, and conclusions. The document discusses the selection of principal components, interpretation of results, and insights derived from correspondence analysis.

### Code

The script used for the analysis is available in the repository under the file name:  
`CA_analysis_gender_age_groups.R`

The script includes:

- Data preprocessing
- PCA computation and visualizations
- CA implementation using R's FactoMineR and factoextra packages
- Visualizations and interpretation of results

### Dependencies

To run the code, ensure you have the following R packages installed:

```r
install.packages(c("FactoMineR", "factoextra", "paran"))
