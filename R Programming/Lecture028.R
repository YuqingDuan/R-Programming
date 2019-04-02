# Lecture028: Time Series(1)
 
ts(
    1:10,
    frequency = 12,
    start = c(1999, 13),
    end = c(2001, 3)
)
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
# 2000   1   2   3   4   5   6   7   8   9  10   1   2
# 2001   3   4   5

value <- sample(0:300, 366, replace = TRUE)
date <- seq(from = as.Date('2016-01-01'),
            by = 1,
            length.out = 366)
df <- data.frame(value = value, time = date)
head(x = df, n = 5)
tail(x = df, n = 5)
#   value       time
# 1    37 2016-01-01
# 2   166 2016-01-02
# 3   229 2016-01-03
# 4    16 2016-01-04
# 5   261 2016-01-05
# ...
#     value       time
# 362   123 2016-12-27
# 363    25 2016-12-28
# 364     9 2016-12-29
# 365    14 2016-12-30
# 366    99 2016-12-31

library(xts)
value <- sample(0:100, 365, replace = T)
times <- seq(from = as.Date('2017-01-01'),
             by = 1,
             length = 365)

myts <- xts(value, times)
head(x =  myts, n = 5)
tail(x =  myts, n = 5)
#            [,1]
# 2017-01-01   79
# 2017-01-02   42
# 2017-01-03    2
# 2017-01-04   53
# 2017-01-05   40
# ...
#            [,1]
# 2017-12-27   14
# 2017-12-28   17
# 2017-12-29   84
# 2017-12-30   58
# 2017-12-31   86

window(myts,
       start = as.Date('2017-01-10'),
       end = as.Date('2017-01-15'))
#            [,1]
# 2017-01-10   35
# 2017-01-11   16
# 2017-01-12   18
# 2017-01-13   15
# 2017-01-14   51
# 2017-01-15   53

# lag()
head(lag(myts))
#              [,1]
# 2017-01-01   NA
# 2017-01-02   79
# 2017-01-03   42
# 2017-01-04    2
# 2017-01-05   53
# 2017-01-06   40

# diff()
head(diff(myts))
#            [,1]
# 2017-01-01   NA
# 2017-01-02  -37
# 2017-01-03  -40
# 2017-01-04   51
# 2017-01-05  -13
# 2017-01-06   13



