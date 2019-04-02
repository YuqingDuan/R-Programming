# Lecture016: Data Aggregation Functions

survival <- data.frame(
    id = 1:10,
    cancer = sample(c('lung', 'liver', 'colon'), 10, replace = T),
    treatment = sample(c('Surg', 'Chemo'), 10, replace = T),
    sur_day = sample(100:1000, 10)
)
#    id cancer treatment sur_day
# 1   1  liver     Chemo     388
# 2   2  liver      Surg     623
# 3   3   lung     Chemo     753
# 4   4   lung     Chemo     823
# 5   5   lung      Surg     280
# 6   6  liver     Chemo     597
# 7   7  colon      Surg     833
# 8   8   lung     Chemo     466
# 9   9  liver     Chemo     926
# 10 10   lung     Chemo     434

# ave()
ave(survival$sur_day, survival$cancer, FUN = mean)
# 633.5 633.5 551.2 551.2 551.2 633.5 833.0 551.2 633.5 551.2

# by()
by(data = survival$sur_day, INDICES = survival$cancer, FUN = mean)
# survival$cancer: colon
# [1] 833
# ----------------------------------------------------- 
#     survival$cancer: liver
# [1] 633.5
# ----------------------------------------------------- 
#     survival$cancer: lung
# [1] 551.2
by(data = survival$sur_day, INDICES = list(survival$cancer, survival$treatment), FUN = mean)
# : colon
# : Chemo
# [1] NA
# ----------------------------------------------------- 
#     : liver
# : Chemo
# [1] 637
# ----------------------------------------------------- 
#     : lung
# : Chemo
# [1] 619
# ----------------------------------------------------- 
#     : colon
# : Surg
# [1] 833
# ----------------------------------------------------- 
#     : liver
# : Surg
# [1] 623
# ----------------------------------------------------- 
#     : lung
# : Surg
# [1] 280

View(mtcars)

aggregate(x = mtcars, by = list(VS = mtcars$vs == 1, high = mtcars$mpg > 22), FUN = mean)
#      VS  high      mpg      cyl     disp       hp     drat       wt
# 1 FALSE FALSE 16.06471 7.647059 318.1412 195.5294 3.331176 3.779647
# 2  TRUE FALSE 19.90000 5.333333 176.5500 111.1667 3.581667 3.133333
# 3 FALSE  TRUE 26.00000 4.000000 120.3000  91.0000 4.430000 2.140000
# 4  TRUE  TRUE 28.05000 4.000000  99.3875  76.5000 4.067500 2.219750
#       qsec vs        am     gear     carb
# 1 16.69353  0 0.2941176 3.470588 3.705882
# 2 19.24500  1 0.1666667 3.500000 2.166667
# 3 16.70000  0 1.0000000 5.000000 2.000000
# 4 19.40000  1 0.7500000 4.125000 1.500000
aggregate(.~Species, data = iris, mean)
#      Species Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     setosa        5.006       3.428        1.462       0.246
# 2 versicolor        5.936       2.770        4.260       1.326
# 3  virginica        6.588       2.974        5.552       2.026

by(mtcars, mtcars$cyl, function(x) lm(mpg~disp + hp, data = x))
# mtcars$cyl: 4
# 
# Call:
#     lm(formula = mpg ~ disp + hp, data = x)
# 
# Coefficients:
#     (Intercept)         disp           hp  
# 43.04006     -0.11954     -0.04609  
# 
# ----------------------------------------------------- 
# mtcars$cyl: 6
# 
# Call:
#     lm(formula = mpg ~ disp + hp, data = x)
# 
# Coefficients:
#     (Intercept)         disp           hp  
# 20.151209     0.001797    -0.006032  
# 
# ----------------------------------------------------- 
# mtcars$cyl: 8
# 
# Call:
#     lm(formula = mpg ~ disp + hp, data = x)
# 
# Coefficients:
#     (Intercept)         disp           hp  
# 24.04478     -0.01863     -0.01132 

my_array <- array(1:24, dim = c(3,4,2))
# , , 1
# 
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12
# 
# , , 2
# 
#      [,1] [,2] [,3] [,4]
# [1,]   13   16   19   22
# [2,]   14   17   20   23
# [3,]   15   18   21   24
sweep(x = my_array, MARGIN = 1, STATS = 3, FUN = '+')
# , , 1
# 
#      [,1] [,2] [,3] [,4]
# [1,]    4    7   10   13
# [2,]    5    8   11   14
# [3,]    6    9   12   15
# 
# , , 2
# 
#      [,1] [,2] [,3] [,4]
# [1,]   16   19   22   25
# [2,]   17   20   23   26
# [3,]   18   21   24   27









