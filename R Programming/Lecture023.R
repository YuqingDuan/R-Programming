# Lecture023: String Processing

x <- c('fudan', 'jiaoda')
# [1] "fudan"  "jiaoda"

nchar(x)
# [1] 5 6

length(x)
# [1] 2

toupper('yuqing')
# [1] "YUQING"

tolower('YUQING')
# [1] "yuqing"

# paste()
stringa <- LETTERS[1:5]
# [1] "A" "B" "C" "D" "E"
STRINGB <- 1:5
# [1] 1 2 3 4 5
paste(stringa, STRINGB, sep = '-')
# [1] "A-1" "B-2" "C-3" "D-4" "E-5"
paste(stringa, STRINGB, collapse = '-')
# [1] "A 1-B 2-C 3-D 4-E 5"

# paste0()
paste0(stringa, STRINGB, collapse = '-')
# [1] "A1-B2-C3-D4-E5"

# strsplit()
stringC <- paste(stringa, STRINGB, sep = '/')
# [1] "A/1" "B/2" "C/3" "D/4" "E/5"

strsplit(stringC, split = '/')
# [[1]]
# [1] "A" "1"
# 
# [[2]]
# [1] "B" "2"
# 
# [[3]]
# [1] "C" "3"
# 
# [[4]]
# [1] "D" "4"
# 
# [[5]]
# [1] "E" "5"

# substr()
stringd <- c('Python', 'java', 'ruby', 'php', 'yixuefang')
sub_str <- substr(stringd, start = 2, stop = 4)
# [1] "yth" "ava" "uby" "hp"  "ixu"
substr(stringd, start = 2, stop = 4) <- 'aaa'

seq_names <- c('EU_FRA02_C1_S2008', '')

# grep()
seq_names <-
    c(
        'EU_FRA02_C1_S2008',
        'AF_COM12_B0_2004',
        'AF_COM17_F0_S2008',
        'AS_CHN11_C3_2004',
        'EU-FRA-C3-S2007',
        'NAUSA02E02005',
        'AS_CHN12_N0_05',
        'NA_USA03_C2_S2007',
        'NA USA04 A3 2004',
        'EU_UK01_A0_2009',
        'eu_fra_a2_s98',
        'SA/BRA08/B0/1996'
    )
fra_seq <- grep(pattern = 'FRA|fra', x = seq_names, value = TRUE)
fra_seq
# [1] "EU_FRA02_C1_S2008" "EU-FRA-C3-S2007"   "eu_fra_a2_s98"    
my_string <- c('above', 'about', 'abrotion', 'cab')
grep('ab\\b', my_string, value = T)
# [1] "cab"

# grepl()
grepl(pattern = 'FRA',
      x = seq_names,
      ignore.case = T)
# [1]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
grepl(pattern = '[s|S][0-9]{2,4}\\b', seq_names)
# [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE

money <- c('$1888','$2888','$3888')
as.numeric(money)
# [1] NA NA NA
# Warning message:
#     NAs introduced by coercion 

gsub('\\$', replacement = '', money)
# [1] "1888" "2888" "3888"

sub('\\$', replacement = '', money)
# [1] "1888" "2888" "3888"

# regexpr()
money <- c('$1888 $2888 $3888')

test_string <- c('happy', 'apple', 'application', 'apolitic')
test_string[regexpr('pp', test_string) > 0]
# [1] "happy"       "apple"       "application"
























