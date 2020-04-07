library(ggplot2)
library(tidyr)
library(dplyr)
library(rstan)
library(data.table)
library(lubridate)
library(gdata)
library(EnvStats)
library(matrixStats)
library(scales)
library(gridExtra)
library(ggpubr)
library(bayesplot)
library(cowplot)

for(i in 1:length(countries)){
  N <- length(dates[[i]])
  N2 <- N + 7
  country <- countries[[i]]
  
  print(sprintf("%s has %d days of data",country,N))
  predicted_cases <- colMeans(prediction[,1:N,i])
  predicted_cases_li <- colQuantiles(prediction[,1:N,i], probs=.025)
  predicted_cases_ui <- colQuantiles(prediction[,1:N,i], probs=.975)
  
  print(sprintf("%s %.0f %.0f %.0f",country,sum(predicted_cases_li),sum(predicted_cases), sum(predicted_cases_ui)))
  
  estimated_deaths_forecast <- colMeans(estimated.deaths[,1:N2,i])[N:N2]
  estimated_deaths_li_forecast <- colQuantiles(estimated.deaths[,1:N2,i], probs=.025)[N:N2]
  estimated_deaths_ui_forecast <- colQuantiles(estimated.deaths[,1:N2,i], probs=.975)[N:N2]
  
  print(sprintf("%s %.0f %.0f %.0f",country,sum(estimated_deaths_li_forecast),sum(estimated_deaths_forecast), sum(estimated_deaths_ui_forecast)))
}