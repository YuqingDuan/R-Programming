# Lecture014:  Factorization of Variables

set.seed(2019)
age <- sample(20:80, 20)
# [1] 44 74 59 35 64 22 45 20 71 29 34 57 67 43 63 37 77 76 52 78

# 1.Formula method
age_fac01 <- 1 + (age >= 30) + (age >= 40) + (age >= 60)
# [1] 3 4 3 2 4 1 3 1 4 1 2 3 4 3 4 2 4 4 3 4

age_fac02 <-
    1 * (age < 30) + 2 * (age >= 30 &
                              age < 40) + 3 * (age >= 40 & age < 50) + 4 * (age >= 50)
# [1] 3 4 4 2 4 1 3 1 4 1 2 4 4 3 4 2 4 4 4 4

# 2.cut()
age_fac03 <-
    cut(
        x = age,
        breaks = 4,
        labels = c("young", "middle", "m-old", "old"),
        include.lowest = T,
        right = T
    )
# [1] middle old    m-old  middle old   
# [6] young  middle young  old    young 
# [11] young  m-old  old    middle m-old 
# [16] middle old    old    m-old  old   
# Levels: young middle m-old old

age_fac04 <-
    cut(
        x = age,
        breaks = seq(20, 80, len = 5),
        labels = c("young", "middle", "m-old", "old"),
        include.lowest = T,
        right = T
    )
# [1] middle old    m-old  young  m-old 
# [6] young  middle young  old    young 
# [11] young  m-old  old    middle m-old 
# [16] middle old    old    m-old  old   
# Levels: young middle m-old old

# 3.ifelse()
ifelse(age > 50, 'old', 'young')
# [1] "young" "old"   "old"   "young" "old"  
# [6] "young" "young" "young" "old"   "young"
# [11] "young" "old"   "old"   "young" "old"  
# [16] "young" "old"   "old"   "old"   "old"
ifelse(age > 60, 'old', ifelse(age < 30, 'young', 'middle'))
# [1] "middle" "old"    "middle" "middle"
# [5] "old"    "young"  "middle" "young" 
# [9] "old"    "young"  "middle" "middle"
# [13] "old"    "middle" "old"    "middle"
# [17] "old"    "old"    "middle" "old" 

# recode()
library(car)
recode(var = age, recodes = 'lo:29 = 1; 30:39 = 2; 40:49 = 3; 50:hi = 4')
# [1] 3 4 4 2 4 1 3 1 4 1 2 4 4 3 4 2 4 4 4 4









