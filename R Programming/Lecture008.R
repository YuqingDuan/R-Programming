# Lecture008: Data Frame

my_df01 <- data.frame(one = c(1.2,2.3,3.4,4.5,5.6), two = LETTERS[1:5], three = c(T,F,T,F,T))
#   one two three
# 1 1.2   A  TRUE
# 2 2.3   B FALSE
# 3 3.4   C  TRUE
# 4 4.5   D FALSE
# 5 5.6   E  TRUE

# my_df01 <- data.frame(one = c(1.2,2.3,3.4,4.5,5.6), two = LETTERS[1:4], three = c(T,F,T,F,T))
# Error in data.frame(one = c(1.2, 2.3, 3.4, 4.5, 5.6), two = LETTERS[1:4],  : 
# arguments imply differing number of rows: 5, 4

# str()
str(my_df01)
# 'data.frame':	5 obs. of  3 variables:
# $ one  : num  1.2 2.3 3.4 4.5 5.6
# $ two  : Factor w/ 5 levels "A","B","C","D",..: 1 2 3 4 5
# $ three: logi  TRUE FALSE TRUE FALSE TRUE

my_df02 <- data.frame(one = c(1.2,2.3,3.4,4.5,5.6), 
                      two = LETTERS[1:5], 
                      three = c(T,F,T,F,T),
                      stringsAsFactors = F
                      )
# 'data.frame':	5 obs. of  3 variables:
# $ one  : num  1.2 2.3 3.4 4.5 5.6
# $ two  : chr  "A" "B" "C" "D" ...
# $ three: logi  TRUE FALSE TRUE FALSE TRUE

# Remove the second column
my_df01$two <- NULL
#   one three
# 1 1.2  TRUE
# 2 2.3 FALSE
# 3 3.4  TRUE
# 4 4.5 FALSE
# 5 5.6  TRUE

# Add a column
my_df01$four <- LETTERS[1:5]
#   one three four
# 1 1.2  TRUE    A
# 2 2.3 FALSE    B
# 3 3.4  TRUE    C
# 4 4.5 FALSE    D
# 5 5.6  TRUE    E

# edit()
my_df03 <- edit(my_df01)
my_df01
#   one three four
# 1 1.2  TRUE    A
# 2 2.3 FALSE    B
# 3 3.4  TRUE    C
# 4 4.5 FALSE    D
# 5 5.6  TRUE    E
my_df03
#   one three four
# 1 1.2  TRUE    A
# 2 2.3 FALSE    B
# 3 3.4  TRUE    C
# 4 4.5 FALSE    D
# 5 5.6  TRUE    F

# fix()
fix(my_df01)
my_df01
#   one three four
# 1 1.2  TRUE    A
# 2 2.3 FALSE    B
# 3 3.4  TRUE    C
# 4 4.5 FALSE    D
# 5 5.6  TRUE    F

# head()
head(iris, n = 5)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa

# tail()
tail(iris)
#     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
# 145          6.7         3.3          5.7         2.5 virginica
# 146          6.7         3.0          5.2         2.3 virginica
# 147          6.3         2.5          5.0         1.9 virginica
# 148          6.5         3.0          5.2         2.0 virginica
# 149          6.2         3.4          5.4         2.3 virginica
# 150          5.9         3.0          5.1         1.8 virginica

# str()
str(iris)
# 'data.frame':	150 obs. of  5 variables:
# $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

# describe()
library('psych')
describe(iris)
#              vars   n mean   sd median trimmed  mad min max range
# Sepal.Length    1 150 5.84 0.83   5.80    5.81 1.04 4.3 7.9   3.6
# Sepal.Width     2 150 3.06 0.44   3.00    3.04 0.44 2.0 4.4   2.4
# Petal.Length    3 150 3.76 1.77   4.35    3.76 1.85 1.0 6.9   5.9
# Petal.Width     4 150 1.20 0.76   1.30    1.18 1.04 0.1 2.5   2.4
# Species*        5 150 2.00 0.82   2.00    2.00 1.48 1.0 3.0   2.0
#               skew kurtosis   se
# Sepal.Length  0.31    -0.61 0.07
# Sepal.Width   0.31     0.14 0.04
# Petal.Length -0.27    -1.42 0.14
# Petal.Width  -0.10    -1.36 0.06
# Species*      0.00    -1.52 0.07

# names()
names(iris)
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"

# Rename the columns
names(iris) <- c('SL','SW','PL','PW','S')
head(iris)
#    SL  SW  PL  PW     S
# 1 5.1 3.5 1.4 0.2 setosa
# 2 4.9 3.0 1.4 0.2 setosa
# 3 4.7 3.2 1.3 0.2 setosa
# 4 4.6 3.1 1.5 0.2 setosa
# 5 5.0 3.6 1.4 0.2 setosa
# 6 5.4 3.9 1.7 0.4 setosa

Sys.setlocale(locale = 'chinese')
names(iris) <- c('中','文','编','码','了')
head(iris)



















