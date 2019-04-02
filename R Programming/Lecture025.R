# Lecture025: stringr package & stringi package

install.packages('stringr')
library(stringr) 

str_c('a', 'b', sep = '-')
# [1] "a-b"

str_length() 

nchar()

# substr()
yxf <- 'yi xue fang'
str_sub(string = yxf,
        start = c(1, 4, 8),
        end = c(2, 6, 11))
# [1] "yi"   "xue"  "fang"

str_sub(yxf, 1, 1) <-  'Y'

fruit <- c("apple", "pear", "banana")
str_dup(fruit, 2)
# [1] "appleapple"   "pearpear"     "bananabanana"

string <- ' Eternal love for YanQ '
str_trim(string, side = 'both')
# [1] "Eternal love for YanQ"

phones <-
    c(
        " 219 733 8965",
        "329-293-8753 ",
        "banana",
        "595 794 7569",
        "387 287 6718",
        "apple",
        "233.398.9187  ",
        "482 952 3315",
        "239 923 8115 and 842 566 4692",
        "Work: 579-499-7527",
        "$1000",
        "Home: 543.355.3679"
    )
str_extract(phones, "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})")
# [1] "219 733 8965" "329-293-8753" NA             "595 794 7569" "387 287 6718" NA             "233.398.9187" "482 952 3315" "239 923 8115"
# [10] "579-499-7527" NA             "543.355.3679"


fruits <- c("one apple", "two pears", "three bananas")
str_replace_all(fruits, "[aeiou]", "-")
# [1] "-n- -ppl-"     "tw- p--rs"     "thr-- b-n-n-s"


install.packages('stringi')
library(stringi)

stri_join(1:7, letters[1:7], sep = '-')
# [1] "1-a" "2-b" "3-c" "4-d" "5-e" "6-f" "7-g"
stri_join(1:7, letters[1:7], collapse = '-')
# [1] "1a-2b-3c-4d-5e-6f-7g"

stri_cmp_eq() & stri_cmp_neq()
stri_cmp_neq('AB', 'aB')
# [1] TRUE

stri_cmp_lt() & stri_cmp_gt()
stri_cmp_gt('a121', 'b221')
# [1] FALSE

language <- c(
    'Python',
    'R',
    'PHP',
    'Ruby',
    'Java',
    'JavaScript',
    'C',
    'Oracle',
    'C++',
    'C#',
    'Spark',
    'Go',
    'Room',
    'Good',
    'Pathon',
    'ScriptJava',
    'R2R',
    'C+',
    'C*'
)
stri_count(language, fixed = 'R')
# [1] 0 1 0 1 0 0 0 0 0 0 0 0 1 0 0 0 2 0 0
stri_count(language, regex = '^J')
# [1] 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0

test <- 'The\u00a0above-mentioned    features are very useful.
Warm thanks to their developers. Tomorrow is a, new$% day###'
stri_count_boundaries(test, type = "word")
# [1] 44
stri_count_boundaries(test, type = "sentence")
# [1] 3
stri_count_boundaries(test, type = "character")
# [1] 109

stri_dup(c("abc", "pqrst"), c(4, 2))
# [1] "abcabcabcabc" "pqrstpqrst"  

stri_duplicated(c("a", "b", "a", NA, "a", NA))
# [1] FALSE FALSE  TRUE FALSE  TRUE  TRUE
stri_duplicated(c("a", "b", "a", NA, "a", NA), fromLast = TRUE)
# [1]  TRUE FALSE  TRUE  TRUE FALSE FALSE
stri_duplicated_any(c("a", "b", "a", NA, "a", NA))
# [1] 3

stri_detect_fixed(c("stringi R", "REXAMINE", "123"), c('i', 'R', '0'))
# [1]  TRUE  TRUE FALSE

stri_detect_regex(c("above", "abort", "about", "abnormal", 'abandon'), '^ab')
# [1] TRUE TRUE TRUE TRUE TRUE
stri_detect_regex(c("above", "abort", "about", "abnormal", 'abandon'), 't\\b')
# [1] FALSE  TRUE  TRUE FALSE FALSE
stri_detect_regex(c('ABOUT', 'abort', 'AboVE'), '^ab', case_insensitive = TRUE)
# [1] TRUE TRUE TRUE

stri_startswith_fixed(c("a1", "a2", "b3", "a4", "c5"), "a")
# [1]  TRUE  TRUE FALSE  TRUE FALSE
stri_startswith_fixed(c("a1", "a2", "b3", "a4", "c5"), "a1")
# [1]  TRUE FALSE FALSE FALSE FALSE
stri_startswith_fixed(c("abaDc", "aabadc", 'ababa'), "ba", from = 2)
# [1]  TRUE FALSE  TRUE
stri_endswith_fixed(c("abaDc", "aabadc", 'ababa'), 'ba')
# [1] FALSE FALSE  TRUE
stri_endswith_fixed(c("abaDc", "aabadc", 'ababa'), 'ba', to = 3)
# [1]  TRUE FALSE  TRUE

tEmp_text <-
    c(
        'EU_FRA02_C1_S2008',
        'AF_COM12_B0_2004',
        'AF_COM17_F0_S2008',
        'AS_CHN11_C3_2004',
        'EU-FRA-C3-S2007',
        'NAUSA02E02005',
        'AS_CHN12_N0_05',
        'NA_USA03_C2_S2007',
        'NA USA04_A3 2004',
        'EU_UK01_A0_2009',
        'eu_fra_a2_s98',
        'SA_BRA08_B0_1996'
    )
#Generate a strings composed by several sequence names.
stri_extract_all(tEmp_text, regex = '[0-9]{2,4}\\b')
# [[1]]
# [1] "2008"
# 
# [[2]]
# [1] "2004"
# 
# [[3]]
# [1] "2008"
# 
# [[4]]
# [1] "2004"
# 
# [[5]]
# [1] "2007"
# 
# [[6]]
# [1] "2005"
# 
# [[7]]
# [1] "05"
# 
# [[8]]
# [1] "2007"
# 
# [[9]]
# [1] "2004"
# 
# [[10]]
# [1] "2009"
# 
# [[11]]
# [1] "98"
# 
# [[12]]
# [1] "1996"

stri_extract_all_fixed("abaBAba",
                       "Aba",
                       case_insensitive = TRUE,
                       overlap = TRUE)
# [[1]]
# [1] "aba" "aBA" "Aba"

stri_extract_all_boundaries("stringi: THE string processing package 123.48...")
# [[1]]
# [1] "stringi: "   "THE "        "string "     "processing " "package "    "123.48..." 
stri_extract_all_words("stringi: THE string processing package 123.48...")
# [[1]]
# [1] "stringi"    "THE"        "string"     "processing" "package"    "123.48"  


