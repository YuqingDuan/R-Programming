# Lecture021: Identification and Processing of Missing Values(2)

library(mlbench)
data("BostonHousing")
original_data <- BostonHousing
View(BostonHousing)

set.seed(2019)
BostonHousing[sample(1:nrow(BostonHousing), 80), 'rad'] <- NA
BostonHousing[sample(1:nrow(BostonHousing), 80), 'ptratio'] <- NA
library(mice)
md.pattern(BostonHousing)


# impute()
library(Hmisc)
im_mean <- impute(BostonHousing$ptratio, mean)
head(im_mean)
#        1         2         3         4         5         6
# 15.30000 18.46338*  17.80000  18.70000  18.70000  18.70000
im_mean <- impute(BostonHousing$ptratio, median)
head(im_mean)
#    1     2     3     4     5     6
# 15.3 19.0*  17.8  18.7  18.7  18.7


# mice()
# ***Random Forest
mice_mod <-
    mice(BostonHousing[, !names(BostonHousing) %in% 'medv'], method = 'rf')
# iter imp variable
# 1   1  rad  ptratio
# 1   2  rad  ptratio
# 1   3  rad  ptratio
# 1   4  rad  ptratio
# 1   5  rad  ptratio
# 2   1  rad  ptratio
# 2   2  rad  ptratio
# 2   3  rad  ptratio
# 2   4  rad  ptratio
# 2   5  rad  ptratio
# 3   1  rad  ptratio
# 3   2  rad  ptratio
# 3   3  rad  ptratio
# 3   4  rad  ptratio
# 3   5  rad  ptratio
# 4   1  rad  ptratio
# 4   2  rad  ptratio
# 4   3  rad  ptratio
# 4   4  rad  ptratio
# 4   5  rad  ptratio
# 5   1  rad  ptratio
# 5   2  rad  ptratio
# 5   3  rad  ptratio
# 5   4  rad  ptratio
# 5   5  rad  ptratio

# complete()
mice_output <- complete(mice_mod)
anyNA(mice_output)
# FALSE

actuals <- original_data$rad[is.na(BostonHousing$rad)]
predicts <- mice_output[is.na(BostonHousing$rad), 'rad']
mean(actuals != predicts)
# 0.1875

library(VIM)
data('airquality')
head(airquality)
#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6

md.pattern(airquality)

# aggr()
aggr_plot <- aggr(
    airquality,
    col = c('red', 'green'),
    numbers = T,
    sortVars = T,
    labels = names(airquality),
    cex.axis = 0.7,
    gap = 3
)

# marginplot()
marginplot(airquality[1:2])

# regressionImp()
head(sleep)
#    BodyWgt BrainWgt NonD Dream Sleep Span Gest Pred Exp Danger
# 1 6654.000   5712.0   NA    NA   3.3 38.6  645    3   5      3
# 2    1.000      6.6  6.3   2.0    NA  4.5   42    3   1      3
# 3    3.385     44.5   NA    NA  12.5 14.0   60    1   1      1
# 4    0.920      5.7   NA    NA  16.5   NA   25    5   2      3
# 5 2547.000   4603.0  2.1   1.8   3.9 69.0  624    3   5      4
# 6   10.550    179.5  9.1   0.7   9.8 27.0  180    4   4      4
sleepIm <-
    regressionImp(NonD + Dream + Sleep + Span + Gest ~ BodyWgt + BrainWgt, data = sleep)
head(sleepIm)
#    BodyWgt BrainWgt       NonD      Dream Sleep     Span Gest Pred Exp Danger NonD_imp
# 1 6654.000   5712.0 -11.732867 -0.6897314   3.3 38.60000  645    3   5      3     TRUE
# 2    1.000      6.6   6.300000  2.0000000   8.3  4.50000   42    3   1      3    FALSE
# 3    3.385     44.5   8.987353  2.0132372  12.5 14.00000   60    1   1      1     TRUE
# 4    0.920      5.7   9.017324  2.0148478  16.5 15.50179   25    5   2      3     TRUE
# 5 2547.000   4603.0   2.100000  1.8000000   3.9 69.00000  624    3   5      4    FALSE
# 6   10.550    179.5   9.100000  0.7000000   9.8 27.00000  180    4   4      4    FALSE
#   Dream_imp Sleep_imp Span_imp Gest_imp
# 1      TRUE     FALSE    FALSE    FALSE
# 2     FALSE     FALSE    FALSE    FALSE
# 3      TRUE     FALSE    FALSE    FALSE
# 4      TRUE     FALSE     TRUE    FALSE
# 5     FALSE     FALSE    FALSE    FALSE
# 6     FALSE     FALSE    FALSE    FALSE