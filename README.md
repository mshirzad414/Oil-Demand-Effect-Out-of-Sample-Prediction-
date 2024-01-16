## Oil Demand Effect 2011-2016 (daily dataset)
##### Source: S&P 500: Yahoo Finance, WTI (oil): Bloomberg, Copper: Bloomberg/CME, Dollar spot index: Bloomberg, Ten-year Treasury rates: Board of Governors via Fred

### This project aims to explain WTI curde oil demand effect using WTI dataset and factors driving oil price changes for the period of 2011 to 2016 using a daily dataset. 
#### To find the oil price demand effect, we first regress the change_log (oil price ) on change_log (copper), change_og (dollar) and change in the 10 year treasury rate considering no intercept.
#### The table below shows the t-statictis for the regression specified below:
                            OLS Regression Results                            
==============================================================================
Dep. Variable:            chng_logoil   R-squared:                       0.368
Model:                            OLS   Adj. R-squared:                  0.366
Method:                 Least Squares   F-statistic:                     60.63
Date:                Mon, 15 Jan 2024   Prob (F-statistic):           4.19e-35
Time:                        14:01:59   Log-Likelihood:                 2266.5
No. Observations:                 754   AIC:                            -4525.
Df Residuals:                     750   BIC:                            -4507.
Df Model:                           3                                         
Covariance Type:                  HAC                                         
==================================================================================
                     coef    std err          t      P>|t|      [0.025      0.975]
----------------------------------------------------------------------------------
const              0.0003      0.000      0.675      0.500      -0.001       0.001
chng_logcopper     0.3973      0.036     11.183      0.000       0.328       0.467
chng_logdollar    -0.7434      0.152     -4.897      0.000      -1.041      -0.445
chng_treasury      0.0632      0.013      5.001      0.000       0.038       0.088
==============================================================================
Omnibus:                       20.551   Durbin-Watson:                   2.051
Prob(Omnibus):                  0.000   Jarque-Bera (JB):               35.332
Skew:                          -0.188   Prob(JB):                     2.13e-08
Kurtosis:                       3.991   Cond. No.                         302.
==============================================================================

Notes:
[1] Standard Errors are heteroscedasticity and autocorrelation robust (HAC) using 5 lags and without small sample correction
#### Secondly, we generate an out-of-sample perdiction by predicting the sample oil price with the regression perdiction we run before. 
#### The last stage shows that we illustrate the predicted out of sample prediction for oil price vs the actual oil price we have dervied from WTI-Bloomberg. 
![image](https://github.com/mshirzad414/Oil-Deamnd-Effect-Out-of-Dample-Prediction-/assets/140922484/3f565dc3-38d6-49e9-888b-3b3fc77cb8dd)


#### The graph above shows that the estimated demand effect of oil prioce we derived from out of sample selection, stand above the actual WTI oil price .It implies that oil price has declined sharply and deeply than its estimated demand from the period of Mar-2014 to Mar-2016. 
