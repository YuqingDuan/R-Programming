# Lecture024: RegEx

# Primitive Expression
mystring1 <- c('apple', 'orange')
grep(pattern = 'p', x = mystring1)
# [1] 1

# Escape Expression 
mystring2 <- c('shuda', '.dfs', '-dsfd')
grep('.', mystring2)
# [1] 1 2 3

mystring3 <- c('9anv', 'fss7', '1000', 'ss7')
grep('[0-1]', mystring3)
# [1] 3

mystring4 <- c('apple', 'application', 'abb')  
grep('^ap', mystring4)
# [1] 1 2

mystring3 <- c('9anv', 'fss7', '5000', 'ss7')
grep('[^0-1]', mystring3)
# [1] 1 2 3 4

mystring6 <- c('1220', '2289', '2228', '10002')
grep('2{2,}', mystring6)
# [1] 1 2 3

mystring7 <- c('food', 'foot', 'foul', 'fans')
grep('fo+', mystring7)
# [1] 1 2 3
grep('fo{1,}', mystring7)
# [1] 1 2 3
grep('(fo){1,}', mystring7)
# [1] 1 2 3

mystring8 <- c('kobe', 'messi', 'neymar')
grep('^k|^m', mystring8)
# [1] 1 2

mystring9 <- c('active', 'positive', 'neagtive', 'iention')
grep('ive$', mystring9)
# [1] 1 2 3

mysting10 <- c('ac^bb', '^df')
grep('\\^', mysting10)
# [1] 1 2

# \\b
# 
# \\d = [0-9]
# 
# \\D = [^0-9]
# 
# \\s 
# 
# \\S
# 
# \\w =[a-zA-Z0-9]
# 
# \\W = [^a-zA-Z0-9]
# 
# \\b
# 
# \\B
# 
# \\<
#     
# \\> 

mystring11 <- c('2013', 'abcd', '13sg')
grep('\\D', mystring11)
# [1] 2 3

mystrinf13 <- c('theory', 'the republic', '  the ')
grep('\\<the\\>', mystrinf13)
# [1] 2 3
















