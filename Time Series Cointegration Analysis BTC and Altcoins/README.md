# Cointegration Analysis between BTC and Other Cryptocurrencies

## Description
This repository contains the code and analysis of a study on the cointegration between the price of **Bitcoin (BTC)** and three other cryptocurrencies: **Solana (SOL), Cardano (ADA), and Binance Coin (BNB)**. The **Engle-Granger** and **Johansen test** methods are implemented to assess the existence of long-term relationships between these assets.

## Analysis Content
1. **Time Series Analysis**
   - Evaluation of seasonality using the **Augmented Dickey-Fuller (ADF)** test.
   - Transformation of data into first-order series.

2. **Cointegration with Engle-Granger**
   - Estimation of relationships using **Ordinary Least Squares (OLS)**.
   - Evaluation of residuals and unit root tests.

3. **Cointegration with the Johansen Test**
   - Identification of cointegration vectors.
   - Comparison with the results from the Engle-Granger test.

## Key Findings
- **Cointegration** exists between BTC and **BNB**, suggesting a long-term relationship between these two cryptocurrencies.
- There is **possible cointegration** between BTC and **SOL**, with a 10% significance level.
- No evidence of **cointegration** between BTC and **ADA**, which contrasts with some prior studies.
- It is recommended to explore **Error Correction Models (VECM)** to model the long-term relationships identified.

## Requirements
To run the analysis, make sure to install the following R packages:
```r
install.packages(c("tseries", "urca", "quantmod"))
```

## links to Data:

https://finance.yahoo.com/quote/BTC-USD/history

https://finance.yahoo.com/quote/BNB-USD/history

https://finance.yahoo.com/quote/SOL-USD/history

https://finance.yahoo.com/quote/ADA-USD/history
