# Lecture020: Identification and Processing of Missing Values(1)

x <- c(1, 2, 3, NA, NA, 4)
mean(x)
# NA
sum(x)
# NA
mean(x, na.rm = T)
# 2.5
sum(x, na.rm = T)
# 10

is.na(x)
# FALSE FALSE FALSE  TRUE  TRUE FALSE

sum(is.na(x))
# 2

x[!is.na(x)]
# 1 2 3 4

iris_na <- iris
for (i in 1:4) {
    iris_na[sample(1:nrow(iris_na), 5), i] = NA
}
sapply(iris_na[, 1:4], function(x)
    which(is.na(x)))
#      Sepal.Length Sepal.Width Petal.Length Petal.Width
# [1,]           51          22           60          39
# [2,]           58          65           65          44
# [3,]           68          69           66          59
# [4,]          101          87           90          63
# [5,]          125          95          135          81
sapply(iris_na[, 1:4], function(x)
    sum(is.na(x)))
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#            5            5            5            5
library(psych)
describe(iris_na)

# Proportion of missing values
sapply(iris_na[, 1:4], function(x)
    (sum(is.na(x))) / sum(nrow(iris_na)))
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#   0.03333333   0.03333333   0.03333333   0.03333333 

lm(Sepal.Length ~ Sepal.Width, data = iris_na)
# Coefficients:
#     (Intercept)  Sepal.Width
#          6.6264      -0.2589

lm(Sepal.Length ~ Sepal.Width,
   data = iris_na,
   na.action = na.omit)
# Coefficients:
#     (Intercept)  Sepal.Width
#          6.6264      -0.2589

mean_value <- sapply(iris_na[, 1:4], mean, na.rm = T)
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#     5.833103     3.062069     3.739310     1.211724 

# Filling in missing values with mean
for (i in 1:4) {
    iris_na[is.na(iris_na[, i]), i] = mean_value[i]
}
describe(iris_na)



cancer <- data.frame(
    id = 1:1000,
    sur_days = sample(100:1000, 1000, replace = T),
    type = sample(c('colon', 'liver', 'lung'), 1000, replace = T),
    treatment = sample(c('chemo', 'sugr'), 1000, replace = T)
)
cancer[sample(1:1000, 90), 2] <- NA

mean_value2 <-
    tapply(cancer$sur_days,
           list(cancer$type, cancer$treatment),
           mean,
           na.rm = T)
#          chemo     sugr
# colon 561.5069 556.6903
# liver 541.6169 515.9240
# lung  563.7698 520.9660

# Filling in missing values with mean
for (i in 1:3) {
    for (j in 1:2) {
        cancer$sur_days[is.na(cancer$sur_days)
                        & cancer$type == rownames(mean_value[i])
                        &
                            cancer$treatment == colnames(mean_value[j])] = mean_value2[i, j]
    }
}
describe(cancer)  







