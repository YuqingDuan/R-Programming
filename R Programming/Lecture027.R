# Lecture027: lubridate package

library(lubridate)

ymd('020217')
# [1] "2002-02-17"

mdy('06182016')
# [1] "2016-06-18"

x <-
    c(
        '2009s01s01',
        '2009-01-02',
        '2009 01 03',
        '2009,1,4',
        '09.1.1',
        'leopard 09 12 09',
        '!!09 ## 12 $$ 12'
    )
x_time <- ymd(x)
# [1] "2009-01-01" "2009-01-02" "2009-01-03" "2009-01-04" "2009-01-01"
# [6] "2009-12-09" "2009-12-12"

ymd_hms('2017 02 19 14 23 23')
# [1] "2017-02-19 14:23:23 UTC"

month(x_time, label = T, abbr = F)
# [1] January  January  January  January  January  December December
# 12 Levels: January < February < March < April < May < June < ... < December

day(x_time)
# [1]  1  2  3  4  1  9 12

mday(x_time)
# [1]  1  2  3  4  1  9 12

wday(x_time)
# [1] 5 6 7 1 5 4 7

new_date <- now()
# [1] "2019-04-01 23:11:07 EDT"

month(new_date) <- 12
# [1] "2019-12-01 23:11:07 EST"

dates <- make_date(year = 2010:2016,
                   month = 1:3,
                   day = 1:5)
# [1] "2010-01-01" "2011-02-02" "2012-03-03" "2013-01-04" "2014-02-05"
# [6] "2015-03-01" "2016-01-02"

x_time <- as.POSIXlt('2009-08-03 12:01:59')
round_date(x_time, unit = 'halfyear')
# [1] "2009-07-01 UTC"

time_t <- c('2017-02', '201609', '2017/5')
ymd(time_t, truncated = 2)
# [1] "2017-02-01" "2016-09-01" "2017-05-01"

time_tt <- ymd('1900,01,01', '1999,12,31')
# [1] "1900-01-01" "1999-12-31"

int <- interval(start = ymd('1900,01,01'),
                end = ymd('1999,12,31'))
time_length(int, unit = 'day')
# [1] 36523

x <- as.POSIXlt('2017-02-03')
x + days(10) + hours(12) + minutes(30)
# [1] "2017-02-13 12:30:00 UTC"
