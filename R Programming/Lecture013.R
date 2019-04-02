# Lecture013: Data Sorting and Length Data - Width Data Conversion 

set.seed(2019)
data <- sample(1:100, 10)
# [1] 77 71 30 60  5 96 78  1 10 56

# sort()
sort(x = data, decreasing = T)
# [1] 96 78 77 71 60 56 30 10  5  1
sort(x = data)
# [1]  1  5 10 30 56 60 71 77 78 96
sort(x = c('ruby', 'r', 'java', 'python'),
     decreasing = F)
# [1] "java"   "python" "r"      "ruby"  

# rank()
rank(x = data)
# [1]  8  7  4  6  2 10  9  1  3  5
rank(c(1, 2, 3, 3, 4, 4, 4, 4, 5))
# 1.0 2.0 3.5 3.5 6.5 6.5 6.5 6.5 9.0

# order()
order(data)
# [1]  8  5  9  3 10  4  2  1  7  6
data[order(data)]
# [1]  1  5 10 30 56 60 71 77 78 96

head(iris[order(iris$Sepal.Length, iris$Sepal.Width, decreasing = T), ])
#     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
# 132          7.9         3.8          6.4         2.0 virginica
# 118          7.7         3.8          6.7         2.2 virginica
# 136          7.7         3.0          6.1         2.3 virginica
# 123          7.7         2.8          6.7         2.0 virginica
# 119          7.7         2.6          6.9         2.3 virginica
# 106          7.6         3.0          6.6         2.1 virginica

freshmen <- c(178, 180, 182, 180)
sophomores <- c(188, 172, 177, 174)
juniors <- c(167, 172, 177, 174)

data.frame(fresh = freshmen, sopho = sophomores, jun = juniors)
#   fresh sopho jun
# 1   178   188 167
# 2   180   172 172
# 3   182   177 177
# 4   180   174 174

freshmen <- c(178, 180, 182, 180)
sophomores <- c(188, 172, 177, 174)
juniors <- c(167, 172, 177, 174)

# Width Data to Length Data
length_data <-
    stack(list(fresh = freshmen, sopho = sophomores, jun = juniors))
#    values   ind
# 1     178 fresh
# 2     180 fresh
# 3     182 fresh
# 4     180 fresh
# 5     188 sopho
# 6     172 sopho
# 7     177 sopho
# 8     174 sopho
# 9     167   jun
# 10    172   jun
# 11    177   jun
# 12    174   jun

tapply(vector = length_data$values, index = length_data$ind, function = mean)
# fresh  sopho    jun 
# 180.00 177.75 172.50 

# reshape()
View(Indometh)
summary(Indometh)

wide <-
    reshape(
        Indometh,
        v.names = "conc",
        idvar = "Subject",
        timevar = "time",
        direction = "wide"
    )
View(wide)

long <-
    reshape(
        wide,
        v.names = "concentrate",
        idvar = "Subject",
        varying = list(2:12),
        direction = "long"
    )
View(long)

# melt()
library(reshape2)
new_iris <- melt(data = iris, id.vars = "Species")
View(new_iris)

# ***dcast()
dcast(new_iris, formula = Species~variable, fun.aggregate = mean, value.var = "value")
#      Species Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     setosa        5.006       3.428        1.462       0.246
# 2 versicolor        5.936       2.770        4.260       1.326
# 3  virginica        6.588       2.974        5.552       2.026

View(tips)
dcast(data = tips, formula = sex~., fun.aggregate = mean, value.var = "tip")
#      sex        .
# 1 Female 2.833448
# 2   Male 3.089618

dcast(data = tips, formula = sex~smoker, fun.aggregate = mean, value.var = "tip")
#      sex       No      Yes
# 1 Female 2.773519 2.931515
# 2   Male 3.113402 3.051167







