# Lecture002: Installation of R Package & The Concept of Vector 

# download packages in CRAN
install.packages('ggplot2')

# check all the packages installed
installed.packages()

# download packages in Github
library(devtools)
install_github('lijian13/rinds')

.libPaths()
# "D:/R-3.5.3/library"

# uninstall of package
remove.packages('acepack')

x <- 1
# 1

y <- 1:5
# 1 2 3 4 5

z <- c(1,2,4,3,5)
# 1 2 4 3 5

# identical()
identical(y,z)
# FALSE 

z[3]
# 4

z[4]
# 3

vector01 <- 1:10
# 1  2  3  4  5  6  7  8  9 10
vector01[1:4]
# 1 2 3 4
vector01[6:10]
# 6  7  8  9 10
vector01[-c(2,5,8)]
# 1  3  4  6  7  9 10

vector02 <- c(1,4,'abc','hello')
# "1"     "4"     "abc"   "hello"

x <- 1:5
y <- 6:10
result01 <- x + y
# 7  9 11 13 15
x <- 1
result02 <- x + y
# 7  8  9 10 11
