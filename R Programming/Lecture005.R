# Lecture005: Factorial Variables

# factor()
my_fac01 <- factor(x = rep(c(1,2), times=5), labels = c('Male','Female'))
# [1] Male   Female Male   Female Male   Female
# [7] Male   Female Male   Female
# Levels: Male Female
class(my_fac01)
# [1] "factor"
my_fac02 <- factor(LETTERS[1:5], labels = letters[1:5])
# [1] a b c d e
# Levels: a b c d e
my_fac03 <- factor(1:5, labels = letters[1:5])
# [1] a b c d e
# Levels: a b c d e

# gl()
my_fac04 <- gl(n = 2, k = 5, labels = c('Controll','Treatment'))
# [1] Controll  Controll  Controll  Controll 
# [5] Controll  Treatment Treatment Treatment
# [9] Treatment Treatment
# Levels: Controll Treatment

my_fac05 <- gl(n = 2, k = 5, length = 3, labels = c('Controll','Treatment'))
# [1] Controll Controll Controll
# Levels: Controll Treatment

# as.character() & as.factor()
temp_str <- c('A','B','AB','O')
# [1] "A"  "B"  "AB" "O"
temp_fac <- as.factor(temp_str)
# [1] A  B  AB O 
# Levels: A AB B O
as.character(temp_fac)
# "A"  "B"  "AB" "O" 
temp_num <- 1:5
as.factor(temp_num)
# [1] 1 2 3 4 5
# Levels: 1 2 3 4 5
as.character(temp_num)
# [1] "1" "2" "3" "4" "5"

# nlevels() & levels()
nlevels(temp_fac)
# 4
nlevels(temp_num)
# [1] 0
levels(temp_fac)
# [1] "A"  "AB" "B"  "O" 

my_fac06 <- gl(n = 4, k = 1, length = 4, labels = c('A','B','AB','O'))
# [1] A  B  AB O 
# Levels: A B AB O

# relevel()
my_fac07 <- relevel(my_fac06, ref = 'O')
# [1] A  B  AB O 
# Levels: O A B AB

my_fac08 <- c('0mg','10mg','20mg','50mg')
# [1] "0mg"  "10mg" "20mg" "50mg"
my_ordered_fac08 <- factor(my_fac08, ordered = T)
# [1] 0mg  10mg 20mg 50mg
# Levels: 0mg < 10mg < 20mg < 50mg

my_fac09 <- c('Placebo','10mg','20mg','50mg')
# [1] "Placebo" "10mg"    "20mg"    "50mg"   
my_ordered_fac09 <- factor(my_fac09, ordered = T)
# [1] Placebo 10mg    20mg    50mg   
# Levels: 10mg < 20mg < 50mg < Placebo

# reorder.factor()
library(DescTools)
my_ordered_fac10 <- reorder.factor(my_ordered_fac09, new.order = my_fac09)
# [1] Placebo 10mg    20mg    50mg   
# Levels: Placebo < 10mg < 20mg < 50mg




