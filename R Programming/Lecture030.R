# Lecture030: Descriptive Statistics

# table()
library(reshape2)
table(tips$sex, tips$smoker)
#        No Yes
# Female 54  33
# Male   97  60
table(tips$sex, tips$day)
#        Fri Sat Sun Thur
# Female   9  28  18   32
# Male    10  59  58   30

hightip <- tips[, "tip"] > mean(tips[, "tip"])

# addmargins() 
tt <- table(esoph$agegp, esoph$ncases)
addmargins(tt, margin = c(1, 2))
#        0  1  2  3  4  5  6  8  9 17 Sum
# 25-34 14  1  0  0  0  0  0  0  0  0  15
# 35-44 10  2  2  1  0  0  0  0  0  0  15
# 45-54  3  2  2  2  3  2  2  0  0  0  16
# 55-64  0  0  2  4  3  2  2  1  2  0  16
# 65-74  1  4  2  2  2  2  1  0  0  1  15
# 75+    1  7  3  0  0  0  0  0  0  0  11
# Sum   29 16 11  9  8  6  5  1  2  1  88

# xtabs()
as.data.frame(xtabs(~ tips$sex + hightip, subset = (tips$smoker ==
                                                        "Yes")))
#   tips.sex hightip Freq
# 1   Female   FALSE   17
# 2     Male   FALSE   26
# 3   Female    TRUE   16
# 4     Male    TRUE   34
as.data.frame(xtabs( ~ tips$sex + hightip,
                     subset = tips$day %in% c("Sun", "Sat")))
#   tips.sex hightip Freq
# 1   Female   FALSE   21
# 2     Male   FALSE   53
# 3   Female    TRUE   25
# 4     Male    TRUE   64
xtabs(ncontrols ~ agegp + alcgp, data = esoph)
#        alcgp
# agegp   0-39g/day 40-79 80-119 120+
# 25-34        61    45      5    5
# 35-44        89    80     20   10
# 45-54        78    81     39   15
# 55-64        89    84     43   26
# 65-74        71    53     29    8
# 75+          27    12      2    3
addmargins(xtabs(ncontrols ~ agegp + alcgp, data = esoph), margin = c(1, 2))
#        alcgp
# agegp   0-39g/day 40-79 80-119 120+ Sum
# 25-34        61    45      5    5 116
# 35-44        89    80     20   10 199
# 45-54        78    81     39   15 213
# 55-64        89    84     43   26 242
# 65-74        71    53     29    8 161
# 75+          27    12      2    3  44
# Sum         415   355    138   67 975

summary(iris)

library(psych)

describe(iris)

library(Hmisc)

describe.data.frame(iris)










