# Lecture009: Basic Operations of Data Frame

# cbind()
my_df01 <- data.frame(one = c(1,2,3,4,5),
                      two = c('a','b','c','d','e'),
                      three = c(T,F,T,F,T)
                      )
my_df02 <- data.frame(four = c(1,2,3,4,5),
                      five = c('A','B','C','D','E'),
                      six = c(T,F,T,F,T)
                      )
my_df03 <- cbind(my_df01, my_df02)
#   one two three four five   six
# 1   1   a  TRUE    1    A  TRUE
# 2   2   b FALSE    2    B FALSE
# 3   3   c  TRUE    3    C  TRUE
# 4   4   d FALSE    4    D FALSE
# 5   5   e  TRUE    5    E  TRUE

# rbind()
my_df04 <- data.frame(one = c(1,2,3,4,5),
                      two = c('a','b','c','d','e'),
                      three = c(T,F,T,F,T)
                      )
my_df05 <- data.frame(one = c(1,2,3,4,5),
                      two = c('A','B','C','D','E'),
                      three = c(T,F,T,F,T)
                      )
my_df06 <- rbind(my_df04, my_df05)
#    one two three
# 1    1   a  TRUE
# 2    2   b FALSE
# 3    3   c  TRUE
# 4    4   d FALSE
# 5    5   e  TRUE
# 6    1   A  TRUE
# 7    2   B FALSE
# 8    3   C  TRUE
# 9    4   D FALSE
# 10   5   E  TRUE

# merge()
my_df07 <- data.frame(one = c(1,2,3,4,5),
                      two = c('a','b','c','d','e'),
                      three = c(T,F,T,F,T)
                     )
my_df08 <- data.frame(one = c(1,2,3,4,5),
                      four = c('A','B','C','D','E'),
                      five = c(T,F,T,F,T)
                     )
my_df09 <- merge(my_df07, my_df08, by = 'one')
#   one two three four  five
# 1   1   a  TRUE    A  TRUE
# 2   2   b FALSE    B FALSE
# 3   3   c  TRUE    C  TRUE
# 4   4   d FALSE    D FALSE
# 5   5   e  TRUE    E  TRUE

# []
set.seed(2019)
iris_sub01 <- iris[sample(1:nrow(iris), 30),]
head(iris_sub01)
#     Petal.Width    Species
# 116         2.3  virginica
# 107         1.7  virginica
# 45          0.4     setosa
# 91          1.2 versicolor
# 8           0.2     setosa
# 7           0.3     setosa

# split(), as.data.frame()
iris_sub02 <- split(x = iris, f = iris$Species)
setosa <- iris_sub02[1]
versicolor <- as.data.frame(iris_sub02[2])
virginica <- as.data.frame(iris_sub02[3])
View(setosa)
View(versicolor)
View(virginica)

# subset()
iris_sub03 <- iris[iris$Species == 'setosa' & iris$Sepal.Length > 5.1, 1:2]
#    Sepal.Length Sepal.Width
# 6           5.4         3.9
# 11          5.4         3.7
# 15          5.8         4.0
# 16          5.7         4.4
# 17          5.4         3.9
# 19          5.7         3.8
# 21          5.4         3.4
# 28          5.2         3.5
# 29          5.2         3.4
# 32          5.4         3.4
# 33          5.2         4.1
# 34          5.5         4.2
# 37          5.5         3.5
# 49          5.3         3.7

iris_sub04 <- subset(x = iris, 
                     subset = (iris$Species == 'setosa') & (iris$Sepal.Length > 5.1), 
                     select = 1:2
                     )
#    Sepal.Length Sepal.Width
# 6           5.4         3.9
# 11          5.4         3.7
# 15          5.8         4.0
# 16          5.7         4.4
# 17          5.4         3.9
# 19          5.7         3.8
# 21          5.4         3.4
# 28          5.2         3.5
# 29          5.2         3.4
# 32          5.4         3.4
# 33          5.2         4.1
# 34          5.5         4.2
# 37          5.5         3.5
# 49          5.3         3.7

identical(iris_sub03, iris_sub04)
# TRUE




























