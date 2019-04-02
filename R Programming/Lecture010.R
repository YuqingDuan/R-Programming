# Lecture010: Conditions and Cycles

# if... else...
i <- -1
if (i > 0) {
    print("i is positive")
} else if (i == 0) {
    print("i is 0")
} else{
    print("i is negative")
}
# [1] "i is negative"

i <- 1
if (i > 0 & i < 2) {
    print("i = 1")
} else{
    print("i don't know")
}
# [1] "i = 1"

x <- 1
if (x > 2) {
    y = 2 * x
    z = 2 * y
} else{
    y = 2 + x
    z = 2 * y
}
y
# [1] 3
z
# [1] 6

x <- 10
y <- c(8, 10, 12, 3, 17)
if (y < x) x else y
# y < x: TRUE FALSE FALSE  TRUE FALSE
# 10
# Warning message:
#   In if (y < x) x else y :
#   the condition has length > 1 and only the first element will be used       

# repeat
i <- 5
repeat {
    if (i >= 25) {
        break
    }
    else{
        print(i)
        i <- i + 5
    }
}
# [1] 5
# [1] 10
# [1] 15
# [1] 20

# while
i <- 5
while (i < 25) {
    print(i)
    i <- i + 5
}
# [1] 5
# [1] 10
# [1] 15
# [1] 20

# for
for (i in 1:10) {
    print(i)
}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6
# [1] 7
# [1] 8
# [1] 9
# [1] 10

set.seed(2019)
x <- sample(10:100, 10)
y <- sample(1:100, 10)
for (i in 1:10) {
    z[i] = x[i] > y[i]
}
z
# 1 1 1 1 0 0 1 0 0 1

set.seed(2019)
x <- sample(10:100, 10)
y <- sample(1:100, 10)
z <- NULL
for (i in 1:10) {
    if (x[i] > y[i]) {
        z = append(z, x[i])
    }
}
z
# 80 74 36 64 79 59

mat <- matrix(data = NA, nrow = 4, ncol = 5)
for (i in 1:4) {
    for (j in 1:5) {
        mat[i, j] <- 2
    }
}
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    2    2    2    2    2
# [2,]    2    2    2    2    2
# [3,]    2    2    2    2    2
# [4,]    2    2    2    2    2

# mean()
mean(c(1:5, NA))
# NA
mean(c(1:5, NA), na.rm = T)
# 3


