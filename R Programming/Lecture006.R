# Lecture006: List & Matrix

my_list01 <- list(1,2,3,'R','hello',T,F)
# [[1]]
# [1] 1
# 
# [[2]]
# [1] 2
# 
# [[3]]
# [1] 3
# 
# [[4]]
# [1] "R"
# 
# [[5]]
# [1] "hello"
# 
# [[6]]
# [1] TRUE
# 
# [[7]]
# [1] FALSE

my_list02 <- list(1:10, letters[1:5])
# [[1]]
# [1]  1  2  3  4  5  6  7  8  9 10
# 
# [[2]]
# [1] "a" "b" "c" "d" "e"

class(my_list02[1])
# [1] "list"
class(my_list02[2])
# [1] "list"

class(my_list02[[1]])
# [1] "integer"
class(my_list02[[2]])
# [1] "character"
class(my_list02[[3]])
# Error in my_list02[[3]] : subscript out of bounds

# how to get 'b' in my_list02
my_list02[[2]][2]
# b

my_list03 <- list(1:10, letters[1:5], list(11:14, LETTERS[1:5]))
# [[1]]
# [1]  1  2  3  4  5  6  7  8  9 10
# 
# [[2]]
# [1] "a" "b" "c" "d" "e"
# 
# [[3]]
# [[3]][[1]]
# [1] 11 12 13 14
# 
# [[3]][[2]]
# [1] "A" "B" "C" "D" "E"

# how to get 'C' in my_list03
my_list03[[3]][[2]][3]
# [1] "C"



my_matrix01 <- matrix(data = 1:6, nrow = 2, byrow = T)
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

my_matrix02 <- matrix(data = 1:10, nrow = 5, byrow = F)
#       [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# [3,]    3    8
# [4,]    4    9
# [5,]    5   10

my_matrix03 <- matrix(data = 2, nrow = 2, ncol = 3, byrow = FALSE)
#       [,1] [,2] [,3]
# [1,]    2    2    2
# [2,]    2    2    2

my_matrix04 <- matrix(data = letters[1:3], nrow = 2, ncol = 4, byrow = FALSE)
# Warning message:
#   In matrix(data = letters[1:3], nrow = 2, ncol = 4, byrow = FALSE) :
#   data length [3] is not a sub-multiple or multiple of the number of rows [2]

#     [,1] [,2] [,3] [,4]
# [1,] "a"  "c"  "b"  "a" 
# [2,] "b"  "a"  "c"  "b" 

my_matrix05 <- matrix(data = 1:12, 
                     nrow = 3, 
                     ncol = 4, 
                     dimnames = list(c('r1','r2','r3'),
                                     c('c1','c2','c3','c4')
                                     )
                     )
#     c1 c2 c3 c4
# r1  1  4  7 10
# r2  2  5  8 11
# r3  3  6  9 12


# t(), Matrix transposition
t(my_matrix05)
#     r1 r2 r3
# c1  1  2  3
# c2  4  5  6
# c3  7  8  9
# c4 10 11 12

my_matrix06 <- matrix(data = c(1:5,letters[1:5]), nrow = 2)
#     [,1] [,2] [,3] [,4] [,5]
# [1,] "1"  "3"  "5"  "b"  "d" 
# [2,] "2"  "4"  "a"  "c"  "e"

my_matrix06[2,]
# [1] "2" "4" "a" "c" "e"
my_matrix06[,2]
# [1] "3" "4"
my_matrix06[2,2]
# 4


