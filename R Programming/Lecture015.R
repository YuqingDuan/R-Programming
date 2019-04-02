# Lecture015: Data Aggregation Function - apply family

mat <- matrix(1:24, nrow = 4, ncol = 6)
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    5    9   13   17   21
# [2,]    2    6   10   14   18   22
# [3,]    3    7   11   15   19   23
# [4,]    4    8   12   16   20   24

# apply()
apply(X = mat, MARGIN = 1, FUN = sum)
# 66 72 78 84
apply(X = mat, MARGIN = 2, FUN = sum)
# 10 26 42 58 74 90
apply(X = iris[, 1:4], MARGIN = 2, FUN = mean)
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#     5.843333     3.057333     3.758000     1.199333
apply(X = iris[, 1:4], MARGIN = 2, FUN = sd)
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#    0.8280661    0.4358663    1.7652982    0.7622377 

# lapply()
lapply(X = c(1:5), FUN = log)
# [[1]]
# [1] 0
# 
# [[2]]
# [1] 0.6931472
# 
# [[3]]
# [1] 1.098612
# 
# [[4]]
# [1] 1.386294
# 
# [[5]]
# [1] 1.609438
lapply(
    X = iris[, 1:3],
    FUN = function(x)
        lm(x ~ iris$Petal.Width, data = iris[, 1:3])
)
# $Sepal.Length
# 
# Call:
#     lm(formula = x ~ iris$Petal.Width, data = iris[, 1:3])
# 
# Coefficients:
#     (Intercept)  iris$Petal.Width  
# 4.7776            0.8886  
# 
# 
# $Sepal.Width
# 
# Call:
#     lm(formula = x ~ iris$Petal.Width, data = iris[, 1:3])
# 
# Coefficients:
#     (Intercept)  iris$Petal.Width  
# 3.3084           -0.2094  
# 
# 
# $Petal.Length
# 
# Call:
#     lm(formula = x ~ iris$Petal.Width, data = iris[, 1:3])
# 
# Coefficients:
#     (Intercept)  iris$Petal.Width  
# 1.084             2.230  


# sapply()
sapply(
    X = 1:5,
    FUN = function(x)
        x + 3
)
# [1] 4 5 6 7 8

# tapply()
tapply(X = iris$Sepal.Length,
       INDEX = iris$Species,
       FUN = mean)
# setosa versicolor  virginica 
# 5.006      5.936      6.588 
tapply(X = iris[, 1:4],
       INDEX = iris$Species,
       FUN = mean)
# Error in tapply(X = iris[, 1:4], INDEX = iris$Species, FUN = mean) : 
#     arguments must have same length


# mapply()
my_fun <- function(x, y) {
    if (x > 4) {
        return(y)
    } else{
        return(x + y)
    }
}
my_fun(1:5, 2:6)
# Warning message:
#     In if (x > 4) { :
#             the condition has length > 1 and only the first element will be used
mapply(my_fun, 1:5, 2:6)
# 3 5 7 9 6











