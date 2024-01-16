## Oil Demand Effect 2011-2016 (daily dataset)
##### Source: S&P 500: Yahoo Finance, WTI (oil): Bloomberg, Copper: Bloomberg/CME, Dollar spot index: Bloomberg, Ten-year Treasury rates: Board of Governors via Fred

### This project aims to explain WTI curde oil demand effect using WTI dataset and factors driving oil price changes for the period of 2011 to 2016 using a daily dataset. 
#### To find the oil price demand effect, we first regress the change_log (oil price ) on change_log (copper), change_og (dollar) and change in the 10 year treasury rate considering no intercept.
![image](https://github.com/mshirzad414/Oil-Deamnd-Effect-Out-of-Dample-Prediction-/assets/140922484/2cfb6ac9-12eb-46e9-8c38-874737a428d6)

#### Secondly, we generate an out-of-sample perdiction by predicting the sample oil price with the regression perdiction we run before. 
#### The last stage shows that we illustrate the predicted out of sample prediction for oil price vs the actual oil price we have dervied from WTI-Bloomberg. 
![image](https://github.com/mshirzad414/Oil-Deamnd-Effect-Out-of-Dample-Prediction-/assets/140922484/3f565dc3-38d6-49e9-888b-3b3fc77cb8dd)


#### The graph above shows that the estimated demand effect of oil prioce we derived from out of sample selection, stand above the actual WTI oil price .It implies that oil price has declined sharply and deeply than its estimated demand from the period of Mar-2014 to Mar-2016. 
