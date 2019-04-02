# Lecture004: Logical Expressions & String Vector

x <- seq(from = 1, to = 100, length.out = 20)
# [1]   1.000000   6.210526  11.421053
# [4]  16.631579  21.842105  27.052632
# [7]  32.263158  37.473684  42.684211
# [10]  47.894737  53.105263  58.315789
# [13]  63.526316  68.736842  73.947368
# [16]  79.157895  84.368421  89.578947
# [19]  94.789474 100.000000
x[T]
# [1]   1.000000   6.210526  11.421053
# [4]  16.631579  21.842105  27.052632
# [7]  32.263158  37.473684  42.684211
# [10]  47.894737  53.105263  58.315789
# [13]  63.526316  68.736842  73.947368
# [16]  79.157895  84.368421  89.578947
# [19]  94.789474 100.000000
x[F]
# numeric(0)
index <- x>80
# [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [8] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [15] FALSE FALSE  TRUE  TRUE  TRUE  TRUE
x[index]
# [1]  84.36842  89.57895  94.78947 100.00000

# which()
which(x>80)
# [1] 17 18 19 20
x[which(x>80)]
# [1]  84.36842  89.57895  94.78947 100.00000

# Find the elements in variable x which between 80 and 90
x[x>80 & x<90]
# [1] 84.36842 89.57895

str01 <- c('abc','def',1,2)
# [1] "abc" "def" "1"   "2"
class(str01[3])
# [1] "character"
is.character(str01)
# [1] TRUE

letters
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
# [11] "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
# [21] "u" "v" "w" "x" "y" "z"

LETTERS
# [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
# [11] "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T"
# [21] "U" "V" "W" "X" "Y" "Z"

letters[1:5]
# [1] "a" "b" "c" "d" "e"

LETTERS[1:5]
# [1] "A" "B" "C" "D" "E"

LETTERS[24:28]
# [1] "X" "Y" "Z" NA  NA 






