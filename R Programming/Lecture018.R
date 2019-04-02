# Lecture018: Data Preprocessing - dplyr package

library(dplyr)
library(reshape2)
View(tips)

# filter()
sub01 <- filter(.data = tips, tips$smoker == 'No', tips$day == 'Sun')
head(sub01)
#   total_bill  tip    sex smoker day   time size
# 1      16.99 1.01 Female     No Sun Dinner    2
# 2      10.34 1.66   Male     No Sun Dinner    3
# 3      21.01 3.50   Male     No Sun Dinner    3
# 4      23.68 3.31   Male     No Sun Dinner    2
# 5      24.59 3.61 Female     No Sun Dinner    4
# 6      25.29 4.71   Male     No Sun Dinner    4

# slice()
sub02 <- slice(.data = tips, 2:5)
sub02
#   total_bill  tip    sex smoker day   time size
# 1      10.34 1.66   Male     No Sun Dinner    3
# 2      21.01 3.50   Male     No Sun Dinner    3
# 3      23.68 3.31   Male     No Sun Dinner    2
# 4      24.59 3.61 Female     No Sun Dinner    4

# select()
sub03 <- select(.data = tips, tip, sex, smoker)
head(sub03)
#    tip    sex smoker
# 1 1.01 Female     No
# 2 1.66   Male     No
# 3 3.50   Male     No
# 4 3.31   Male     No
# 5 3.61 Female     No
# 6 4.71   Male     No
sub04 <- select(.data = tips, tip:smoker)
head(sub04)
#    tip    sex smoker
# 1 1.01 Female     No
# 2 1.66   Male     No
# 3 3.50   Male     No
# 4 3.31   Male     No
# 5 3.61 Female     No
# 6 4.71   Male     No

# arrange()
new_tips01 <- arrange(.data = tips, desc(total_bill), tip)
head(new_tips01)
#   total_bill   tip    sex smoker day   time size
# 1      50.81 10.00   Male    Yes Sat Dinner    3
# 2      48.33  9.00   Male     No Sat Dinner    4
# 3      48.27  6.73   Male     No Sat Dinner    4
# 4      48.17  5.00   Male     No Sun Dinner    6
# 5      45.35  3.50   Male    Yes Sun Dinner    3
# 6      44.30  2.50 Female    Yes Sat Dinner    3

# rename()
new_tips02 <- rename(.data = tips, bill = total_bill, tipp = tip)
names(new_tips02)
# [1] "bill"   "tipp"   "sex"    "smoker" "day"    "time"   "size"  

# distinct()
distinct(.data = tips, day)
#    day
# 1  Sun
# 2  Sat
# 3 Thur
# 4  Fri

# mutate()
mutate(.data = tips,
       rate = tip / total_bill,
       new_rate = rate * 100)
#     total_bill  tip    sex smoker  day   time size       rate  new_rate
# 1        16.99 1.01 Female     No  Sun Dinner    2 0.05944673  5.944673
# 2        10.34 1.66   Male     No  Sun Dinner    3 0.16054159 16.054159
# 3        21.01 3.50   Male     No  Sun Dinner    3 0.16658734 16.658734
# 4        23.68 3.31   Male     No  Sun Dinner    2 0.13978041 13.978041
# 5        24.59 3.61 Female     No  Sun Dinner    4 0.14680765 14.680765
# ...
# 108      25.21 4.29   Male    Yes  Sat Dinner    2 0.17017057 17.017057
# 109      18.24 3.76   Male     No  Sat Dinner    2 0.20614035 20.614035
# 110      14.31 4.00 Female    Yes  Sat Dinner    2 0.27952481 27.952481
# 111      14.00 3.00   Male     No  Sat Dinner    2 0.21428571 21.428571
# [ reached 'max' / getOption("max.print") -- omitted 133 rows ]

# Compare mutate() with transform()
transform(.data = tips,
          rate = tip / total_bill,
          new_rate = rate * 100)
# Error in eval(substitute(list(...)), `_data`, parent.frame()) : 
#     argument "_data" is missing, with no default

# sample_n()
sample_n(tbl = iris, size = 4)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 1          5.7         3.8          1.7         0.3     setosa
# 2          5.8         2.7          3.9         1.2 versicolor
# 3          6.8         3.0          5.5         2.1  virginica
# 4          4.4         2.9          1.4         0.2     setosa

# sample_frac()
sample_frac(tbl = iris, size = 0.02)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 1          5.9         3.2          4.8         1.8 versicolor
# 2          6.3         2.7          4.9         1.8  virginica
# 3          4.6         3.1          1.5         0.2     setosa

# group_by()
group <- group_by(.data = tips, smoker)
summarise(
    .data = group,
    count = n(),
    mean_tip = mean(tip),
    sd_bill = sd(total_bill)
)
# smoker count mean_tip sd_bill
# <fct>  <int>    <dbl>   <dbl>
# 1 No       151     2.99    8.26
# 2 Yes       93     3.01    9.83

# %>%
result <- tips %>% group_by(smoker, sex) %>% summarise(
    count = n(),
    mean_tip = mean(tip),
    sd_bill = sd(total_bill)
)
# smoker sex    count mean_tip sd_bill
# <fct>  <fct>  <int>    <dbl>   <dbl>
# 1 No     Female    54     2.77    7.29
# 2 No     Male      97     3.11    8.73
# 3 Yes    Female    33     2.93    9.19
# 4 Yes    Male      60     3.05    9.91

# join()
df_a <- data.frame(x = c('a', 'b', 'c', 'a', 'c', 'b', 'c'), y = 1:7)
df_b <- data.frame(x = c('a', 'b', 'a'), z = 10:12)
inner_join(x = df_a, y = df_b, by = 'x')
semi_join(x = df_a, y = df_b, by = 'x')
anti_join(x = df_a, y = df_b, by = 'x')
left_join(x = df_a, y = df_b, by = 'x')
right_join(x = df_a, y = df_b, by = 'x')






























