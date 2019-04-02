# Lecture017: Data Preprocessing - plyr package

library(plyr)

# aaply()
my_matrix <- matrix(data = 1:24,
                    nrow = 3,
                    ncol = 8)
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,]    1    4    7   10   13   16   19   22
# [2,]    2    5    8   11   14   17   20   23
# [3,]    3    6    9   12   15   18   21   24
aaply(.data = my_matrix,
      .margins = 2,
      .fun = mean)
# 1  2  3  4  5  6  7  8 
# 2  5  8 11 14 17 20 23 

# Slight differences between aaply() and adply()
adply(.data = my_matrix,
      .margins = 2,
      .fun = mean)
#   X1 V1
# 1  1  2
# 2  2  5
# 3  3  8
# 4  4 11
# 5  5 14
# 6  6 17
# 7  7 20
# 8  8 23

# laply()
my_list <- list(1:10, 2:8, rep(c(T, F), times = 5))
# [[1]]
# [1]  1  2  3  4  5  6  7  8  9 10
# 
# [[2]]
# [1] 2 3 4 5 6 7 8
# 
# [[3]]
# [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE
laply(.data = my_list, .fun = mean)
# [1] 5.5 5.0 0.5

# ddply()
my_df <- data.frame(
    name = c('Tony', 'Andy', 'Bob', 'Mary', 'Leo'),
    height = c(178, 176, 175, 167, 190),
    gender = c('M', 'F', 'F', 'M', 'M'),
    age_level = c('old', 'young', 'young', 'old', 'young')
)
#   name height gender age_level
# 1 Tony    178      M       old
# 2 Andy    176      F     young
# 3  Bob    175      F     young
# 4 Mary    167      M       old
# 5  Leo    190      M     young
ddply(
    .data = my_df,
    .variables = .(gender),
    .fun = summarise,
    mean_height = mean(height)
)
#   gender mean_height
# 1      F    175.5000
# 2      M    178.3333
ddply(
    .data = my_df,
    .variables = .(gender),
    .fun = summarise,
    mean_height = mean(height),
    sd_height = sd(height)
)
#   gender mean_height  sd_height
# 1      F    175.5000  0.7071068
# 2      M    178.3333 11.5036226
ddply(
    .data = my_df,
    .variables = .(gender, age_level),
    .fun = summarise,
    mean_height = mean(height),
    sd_height = sd(height)
)
#   gender age_level mean_height sd_height
# 1      F     young       175.5 0.7071068
# 2      M       old       172.5 7.7781746
# 3      M     young       190.0        NA

library(reshape2)
View(tips)
ddply(
    .data = tips,
    .variables = .(sex, smoker),
    .fun = function(x)
        sum(x$tip) / sum(x$total_bill)
)
#      sex smoker        V1
# 1 Female     No 0.1531892
# 2 Female    Yes 0.1630623
# 3   Male     No 0.1573122
# 4   Male    Yes 0.1369188
ddply(
    .data = tips,
    .variables = ~ sex + smoker,
    .fun = function(x)
        sum(x$tip) / sum(x$total_bill)
)
#      sex smoker        V1
# 1 Female     No 0.1531892
# 2 Female    Yes 0.1630623
# 3   Male     No 0.1573122
# 4   Male    Yes 0.1369188
ddply(
    .data = iris,
    .variables = ~ Species,
    .fun = colwise(.fun = mean, .cols = .(Sepal.Length, Sepal.Width))
)
#      Species Sepal.Length Sepal.Width
# 1     setosa        5.006       3.428
# 2 versicolor        5.936       2.770
# 3  virginica        6.588       2.974
ddply(
    .data = iris,
    .variables = ~ Species,
    .fun = colwise(.fun = mean, .cols = ~ Sepal.Length + Sepal.Width)
)
#      Species Sepal.Length Sepal.Width
# 1     setosa        5.006       3.428
# 2 versicolor        5.936       2.770
# 3  virginica        6.588       2.974

# each()
each(mean, sd, median)(iris$Sepal.Length)
#      mean        sd    median 
# 5.8433333 0.8280661 5.8000000 

# colwise()
colwise(mean)(iris)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1     5.843333    3.057333        3.758    1.199333      NA
# Warning message:
#     In mean.default(X[[i]], ...) :
#     argument is not numeric or logical: returning NA

# numcolwise()
numcolwise(mean)(iris)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     5.843333    3.057333        3.758    1.199333

















