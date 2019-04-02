# Lecture007: Array & Data Frame

my_array01 <- array(data = 1:16, dim = c(2,4,2))
# , , 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    3    5    7
# [2,]    2    4    6    8
# 
# , , 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    9   11   13   15
# [2,]   10   12   14   16

# dim()
dim(my_array01)
# 2 4 2
dim(my_array01) <- c(4,2,2)
# , , 1
# 
#       [,1] [,2]
# [1,]    1    5
# [2,]    2    6
# [3,]    3    7
# [4,]    4    8
# 
# , , 2
# 
#       [,1] [,2]
# [1,]    9   13
# [2,]   10   14
# [3,]   11   15
# [4,]   12   16

my_array02 <- array(data = 1:16, 
                    dim = c(4,2,2), 
                    dimnames = list(c('r1','r2','r3','r4'), 
                                    c('c1','c2'), 
                                    c('layer01','layer02')
                                    )
                    )
# , , layer01
# 
#     c1 c2
# r1  1  5
# r2  2  6
# r3  3  7
# r4  4  8
# 
# , , layer02
# 
#     c1 c2
# r1  9 13
# r2 10 14
# r3 11 15
# r4 12 16

my_array02[2,2]
# Error in my_array2[2, 2] : incorrect number of dimensions
my_array02[1,1,3]
# Error in my_array2[1, 1, 3] : subscript out of bounds
my_array02[1,1,]
# layer01 layer02 
# 1       9 
my_array02[2,2,1]
# 6



# data.frame()
my_df01 <- data.frame(name = c('TOM','ANDY','MARRY'), 
                      age = c(24,25,26), 
                      height = c(178,176,156)
                      )
#    name age height
# 1   TOM  24    178
# 2  ANDY  25    176
# 3 MARRY  26    156

# nrow()
nrow(my_df01)
# 3

# ncol()
ncol(my_df01)
# 3

# dim()
dim(my_df01)
# 3 3

# View()
View(my_df01)
View(iris)








