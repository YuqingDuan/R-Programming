# Lecture029: Time Series(2)

View(co2)
class(co2)
# [1] "ts"

# Training Set and Test Set
# 70%, 30%
# 80%, 20%

Training_Set <- co2[1:400]
class(Training_Set)
# [1] "numeric"

# ts()
Training_Set <-
    ts(data = Training_Set,
       start = start(co2),
       frequency = frequency(co2))
plot(Training_Set)

# decompose()
Decomposed_Training_Set <- decompose(Training_Set)
plot(Decomposed_Training_Set)

# SARIMA Model: Autoregressive Integrated Moving Average Model
# ARIMA(P,D,Q)
# P: Order of self-correlation
# D: Order of difference
# Q: Order of sliding average

# We need a mean stationary sequence as the object of modeling.
# How to judge whether a sequence is mean stationary?
# Using kpss.test() 
# if(p-value>=0.05), then the sequence is mean stationary.
library(tseries)
kpss.test(Training_Set)
# KPSS Test for Level Stationarity
# 
# data:  Training_Set
# KPSS Level = 6.6342, Truncation lag
# parameter = 5, p-value = 0.01

# Make it mean stationary by diff()

kpss.test(diff(Training_Set))
# KPSS Test for Level Stationarity
# 
# data:  diff(Training_Set)
# KPSS Level = 0.023192, Truncation lag
# parameter = 5, p-value = 0.1
# so, D = 1

# then we need to get the value of Q
# Autocorrelation coefficient 
acf(Training_Set)
# Q = 1

# then we need to get the value of P
# Partial autocorrelation coefficient 
pacf(Training_Set)
# P = 1

# The expression of the final model: SARIMA(1,1,1)*(1,1,1)12

# Model Building
library(forecast)
co2_fit <- Arima(Training_Set,
                 order = c(1, 1, 1),
                 seasonal = list(order = c(1, 1, 1), period = 12))

# Model Testing
co2_fore <- forecast(co2_fit, 68)

plot(co2, col = 'red')
par(new = TRUE)
plot(co2_fore)