**Overview**

This project investigates the factors influencing health insurance charges based on data from 1,338 policyholders. The analysis aims to identify the most significant predictors of insurance costs, such as demographic characteristics, lifestyle factors, and regional differences. The insights derived from this study are intended to inform insurance pricing strategies and policyholder decision-making.

**Objectives**
To analyze the relationship between health insurance charges and independent variables such as:
Age
Smoking status
BMI (Body Mass Index)
Number of children
Gender
Region
To explore associations and identify significant predictors using statistical and machine learning methods.
To provide actionable insights for stakeholders, including insurance providers and policymakers.

**Features of the Analysis**

**Data Processing and Exploration**

_Dataset:_ The dataset contains 1,338 records with variables such as age, sex, BMI, children, smoker, region, and charges.
_Data Cleaning_: Ensured data consistency, handled outliers, and created new categorical variables such as BMI_Category, High, and Child for specific analyses.

**Statistical and Predictive Modeling**

_Descriptive Statistics:_

Summary statistics for all variables (mean, median, standard deviation, skewness, kurtosis).
Correlation analysis among continuous variables.

_Visualization:_

Histograms, boxplots, scatter plots, density plots, and cumulative distribution plots.
Comparison of insurance charges across categorical groups like smoking status, region, and sex.

_Inferential Statistics:_

Hypothesis testing using t-tests (independent and Welch’s), ANOVA, and Tukey's HSD for group comparisons.
Risk ratio calculations to assess the impact of binary variables.

_Regression Modeling:_

Linear regression to quantify relationships between predictors and charges.
Multiple linear regression models incorporating all key variables.
Log-transformation of charges to address heteroscedasticity and non-normality.

_Advanced Analysis_

Feature Engineering: Derived variables like BMI categories (Underweight, Normal, Overweight, Obese) to enhance interpretability.

_Diagnostics:_

Cook’s Distance and Leverage plots to identify influential data points.
Residual diagnostics to evaluate model fit and assumptions.

_Predictive Insights:_

Smoking is the most significant predictor, with smokers incurring significantly higher charges (~$24,000 more than non-smokers).
Age, BMI, and the presence of children also influence charges substantially.
Regional differences are evident but modest, with the Southeast region showing higher average charges.

**Methodology**

Tools and Libraries
Programming Language: R

**Libraries Used:**

_Data Manipulation:_ dplyr, readxl
_Visualization:_ ggplot2
_Statistical Analysis:_ car, epitools, e1071
_Correlation Analysis:_ corrplot
_Effect Size:_ effsize

**Statistical Techniques**


_Descriptive Analysis:_ Explored data distributions and identified skewness in insurance charges.

_Hypothesis Testing:_
Used t-tests for binary variables (e.g., sex, smoker).
ANOVA and Tukey’s HSD for categorical variables with more than two groups (e.g., BMI, region).

_Regression Modeling:_
Simple Linear Regression to examine individual predictors.
Multiple Linear Regression to assess combined effects of variables.
Log-transformation of charges for improved model fit.

_Model Diagnostics_
Residual vs. Fitted plots to check for non-linearity and heteroscedasticity.
Q-Q plots to assess normality of residuals.
Scale-Location plots for variance homogeneity.
Residuals vs. Leverage plots to detect influential points.

**Key Findings**

_Demographic Predictors:_

Age has a moderate positive correlation with charges (r = 0.299).
Gender differences are statistically significant but practically negligible (males have ~$1,387 higher average charges).

_Lifestyle Factors:_

Smokers pay significantly higher premiums, with a mean difference of ~$24,000 compared to non-smokers.
Obesity increases charges by an average of ~$5,143 compared to normal-weight individuals.

_Regional Differences:_

The Southeast region has the highest mean charges ($14,735), while the Southwest has the lowest ($12,347).

_Family Size:_

Individuals with children have slightly higher charges (~$1,584 more on average).

_High-Cost Cases:_

Smoking and obesity are the most significant contributors to high-cost outliers.

**Outputs**

Visualizations

_Distributions:_

Histograms of charges to display positive skewness.
Density and cumulative distribution plots.

_Comparative Plots:_

Boxplots for charges by smoking status, region, sex, and BMI category.

_Relationship Plots:_

Scatterplots with regression lines to show relationships between continuous predictors (e.g., age and charges).

_Statistical Models_

Coefficient summaries and p-values for all predictors.
Adjusted R-squared values for model performance.
Diagnostic plots for residual analysis and model fit.

**Usage Prerequisites**

Install R and RStudio.
Install required libraries using:
R
Copy code
install.packages(c("dplyr", "ggplot2", "car", "e1071", "epitools", "corrplot", "effsize", "readxl"))

_Steps to Run_

Load the dataset (insurance-2.xlsx) using read_excel.
Execute the R scripts provided (insurance_analysis.R) to reproduce the analysis.

**Review outputs:**

Visualizations in RStudio’s plotting pane.
Statistical summaries in the console.

**File Structure**

insurance_analysis.R: Main script for data analysis.
insurance-2.xlsx: Input dataset.
README.md: Comprehensive documentation.

**Future Work**

_Enhanced Predictors:_

Incorporate medical history and lifestyle data for a more robust model.
Use time-series data to predict insurance charges over time.
_Machine Learning Models:_

Deploy models like Random Forest or Gradient Boosting for non-linear relationships.

_Policy Simulation:_

Model the impact of changes in premiums based on smoking cessation or weight loss.

Incorporate more advanced predictive modeling techniques, such as Gradient Boosting or Neural Networks.

Perform time-series analysis if temporal data becomes available.

Extend the analysis to include external datasets for benchmarking.

**Contributing**

Contributions are welcome! If you have ideas for additional analyses or enhancements, feel free to fork the repository and submit a pull request.

**Contact**

For questions or suggestions, please contact the repository maintainer at dr.raagalikhitha@gmail.com.

