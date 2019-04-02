# Lecture012: Reading and Writing of Data 

# scan()
x <- scan()
# > x <- scan()
# 1: 1
# 2: 2
# 3: 3
# 4: 
#     Read 3 items
# > 
#     > x
# [1] 1 2 3

# cat()
cat(1:10, file = 'E:/r/cat.txt')

# SPASS, SAS, STATA
library(foreign)
my_spass <- read.spss(file = 'xxx.sav', to.data.frame = T)
View(my_spass)

# read xxx.fasta
my_fasta01 <- readLines('xxx.fasta')
View(my_fasta01)

# stringi
library(stringi)
my_fasta02 <- stri_read_lines('xxx.fasta')
View(my_fasta02)

# Export data
write.csv(my_iris01, file = 'E:/r/my_new_iris1.csv')
write.csv(my_iris03, file = 'E:/r/my_new_iris3.xls')
writeLines(text = 'E:/r/xxx.fasta')