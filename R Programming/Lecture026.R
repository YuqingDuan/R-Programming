# Lecture026: Processing of Time and Date Data

as.Date('2017-02-16', format =)
# [1] "2017-02-16"

class(as.Date('2017-02-16', format = ))
# [1] "Date"

as.Date('2/16/2017', format = '%m/%d/%Y')
# [1] "2017-02-16"

# %m 
# 
# %b:jan
# 
# %B:july
# 
# %Y 2017
# 
# %y 17

as.Date('March 10, 1993', format = '%B %d, %Y')
# [1] "1993-03-10"

as.Date('10Mar93', '%d%b%y')
# [1] "1993-03-10"

as.Date(100, origin = '2017-02-16')
# [1] "2017-05-27"

ISOdate(1993, 3, 10, 16, 14, 20)
# [1] "1993-03-10 16:14:20 GMT"

# POSIX
dts <- c('2005-10-21 18:24:24', "2017-02-16 19:20:20")
as.POSIXlt(dts)
# [1] "2005-10-21 18:24:24 EDT" "2017-02-16 19:20:20 EST"

# strptime() & strftime()
time <- strptime('04/3/2016:16:18:34', format = '%d/%m/%Y:%H:%M:%S')
# [1] "2016-03-04 16:18:34 EST"
strftime(time, 'Now is %H:%M on %Y %m %d')
# [1] "Now is 16:18 on 2016 03 04"

julian(as.Date('2017-02-16'), origin = as.Date('2016-02-19'))
# [1] 363

difftime(as.Date('2017-02-16'), as.Date('2016-02-19'), units = 'weeks')
# Time difference of 51.85714 weeks

mean(c(as.Date('2017-02-16'), as.Date('2016-02-19')))
# [1] "2016-08-18"

dateline <-
    seq(as.Date('2016-02-10'), by = '2 weeks', length.out = 10)
# [1] "2016-02-10" "2016-02-24" "2016-03-09" "2016-03-23" "2016-04-06" "2016-04-20" "2016-05-04" "2016-05-18" "2016-06-01" "2016-06-15"

library(stringi)
my_newtime <-
    stri_datetime_add(as.Date('2017-02-16'), value = 10, units = 'days')
# [1] "2017-02-25 19:00:00 EST"

stri_datetime_create(2014, 4, 20)
# [1] "2014-04-20 12:00:00 EDT"

stri_datetime_parse(c('2015-02-27', '2015-02-29'), 'yyyy-MM-dd', lenient = TRUE)
# [1] "2015-02-27 22:29:16 EST" "2015-03-01 22:29:16 EST"

stri_datetime_parse('DEC-29', 'MMM-dd')
# [1] "2019-12-29 22:29:39 EST"

