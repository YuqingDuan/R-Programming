# Lecture003: Numerical vector & Logical vector

vector01 <- c(1:3,6:10)
# 1  2  3  6  7  8  9 10

x <- 1
# 1

class(x)
# "numeric"

class(vector01)
# "integer"

# There is no float class in R, only numeric calss and integer class
3/2
# 1.5

# seq()
seq(from = 1, to = 5, by = 1)
# 1 2 3 4 5
seq(from = 1, to = 5, by = 0.5)
# 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
seq(from = 1, to = 5, length.out = 8)
# 1.000000 1.571429 2.142857 2.714286 3.285714 3.857143 4.428571 5.000000
seq(from = 1, to = 5, len = 8)
# 1.000000 1.571429 2.142857 2.714286 3.285714 3.857143 4.428571 5.000000
seq(from = 1, to = 5,  along.with = 1:8)
# 1.000000 1.571429 2.142857 2.714286 3.285714 3.857143 4.428571 5.000000

# rep()
rep(c(1,3), times = 5)
# 1 3 1 3 1 3 1 3 1 3
rep(c(1,3), each = 5)
# 1 1 1 1 1 3 3 3 3 3
rep(c(1,3), len = 3)
# 1 3 1

# length()
length(rep(c(1,3), times = 5))
# 10

# Logical expression
logit01 <- rep(c(T,F), len = 5)
# TRUE FALSE  TRUE FALSE  TRUE
class(logit01)
# "logical"
logit02 <- c(100>99, 100>101)
# TRUE FALSE
logit03 <- c(100==100, 100==1)
# TRUE FALSE
logit04 <- 100!=1
# TRUE
logit05 <- 100>90 & 100>110
# FALSE
logit06 <- 100>90 | 100>110
# TRUE












