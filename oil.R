# Load libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(lmtest)
library(sandwich)

rm(list=ls())

# Load the data
oil <- read.csv("oil.csv")

# Calculate changes in logs and convert date
oil <- oil %>%
  mutate(chng_logoil = log(wti) - lag(log(wti)),
         chng_logcopper = log(copper) - lag(log(copper)),
         chng_logdollar = log(dollar) - lag(log(dollar)),
         chng_treasury = tenyear - lag(tenyear),
         date = as.Date(date, format = "%m/%d/%Y"))

# data filter for the period specified 
oilSample <- oil %>%
  filter(date >= as.Date("2011-06-01") & date <= as.Date("2014-06-01"))

#regression with Newey-West standard errors
regression <- lm(chng_logoil ~ chng_logcopper + chng_logdollar + chng_treasury - 1, data = oilSample)
robust_se <- coeftest(regression, vcov. = NeweyWest(regression, lag = 5))

#  regression results
print(robust_se)

# out-of-sample dataset with the same predictors
out_of_sample_data <- oil %>%
  filter(date >= as.Date("2014-06-02")) %>%
  select(date, chng_logcopper, chng_logdollar, chng_treasury)

# predictions for the out-of-sample data
out_of_sample_predictions <- predict(regression, newdata = out_of_sample_data)

# adding predicted oil price change 
initial_log_oil_price <- log(oilSample$wti[nrow(oilSample)])
out_of_sample_data <- out_of_sample_data %>%
  mutate(predicted_chng_logoil = out_of_sample_predictions,
         predicted_log_oil_price = cumsum(predicted_chng_logoil) + initial_log_oil_price,
         predicted_oil_price = exp(predicted_log_oil_price))

#plotting predicted vs actual wti price at level 
ggplot() +
  geom_line(data = out_of_sample_data, aes(x = date, y = predicted_oil_price, color= "Oil Demand"), size = 1) +
  geom_line(data = oil, aes(x = date, y = wti, color= "WTI"), size = 1) +
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x ='WTI vs Oil Demand Only ' , y = 'dollar per barrel', title = 'Figure 3:WTI Crude Estiamte Demand Effect')

# the graph above shows the ggplot 
