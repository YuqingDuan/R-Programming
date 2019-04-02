# Lecture022: Processing of Outliers and Duplicates

set.seed(2019)
mmhg <- sample(60:250, 1000, replace = T)
range(mmhg)
# 60 250
max(mmhg)
min(mmhg)

quantile(mmhg)
#    0%    25%    50%    75%   100%
# 60.00 105.75 159.00 203.00 250.00
fivenum(mmhg)
# 60.0 105.5 159.0 203.0 250.0

outlierKD <- function(dt, var) {
    var_name <- eval(substitute(var), eval(dt))
    tot <- sum(!is.na(var_name))
    na1 <- sum(is.na(var_name))
    m1 <- mean(var_name, na.rm = T)
    par(mfrow = c(2, 2), oma = c(0, 0, 3, 0))
    boxplot(var_name, main = "With outliers")
    hist(var_name,
         main = "With outliers",
         xlab = NA,
         ylab = NA)
    # Change this line: define your outlier!
    outlier <- var_name[var_name > 230]
    mo <- mean(outlier)
    var_name <- ifelse(var_name %in% outlier, NA, var_name)
    boxplot(var_name, main = "Without outliers")
    hist(var_name,
         main = "Without outliers",
         xlab = NA,
         ylab = NA)
    title("Outlier Check", outer = TRUE)
    na2 <- sum(is.na(var_name))
    cat("Outliers identified:", na2 - na1, "\n")
    cat("Propotion (%) of outliers:", round((na2 - na1) / tot * 100, 1), "\n")
    cat("Mean of the outliers:", round(mo, 2), "\n")
    m2 <- mean(var_name, na.rm = T)
    cat("Mean without removing outliers:", round(m1, 2), "\n")
    cat("Mean if we remove outliers:", round(m2, 2), "\n")
    response <- readline(prompt = "Do you want to remove outliers
                         and to replace with NA? [yes/no]: ")
    if (response == "y" | response == "yes") {
        dt[as.character(substitute(var))] <- invisible(var_name)
        assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
        cat("Outliers successfully removed", "\n")
        return(invisible(dt))
    } else{
        cat("Nothing changed", "\n")
        return(invisible(var_name))
    }
}

set.seed(2019)
df <-
    data.frame(bp = c(sample(80:250, 1000, replace = TRUE), NA, 390, 100))
outlierKD(df, bp)
# Outliers identified: 110 
# Propotion (%) of outliers: 11 
# Mean of the outliers: NA 
# Mean without removing outliers: 162.31 
# Mean if we remove outliers: 152.56 
# Do you want to remove outliers and to replace with NA? [yes/no]: yes
# Outliers successfully removed 


x <- c(1, 2, 3, 4, 5, 1, 2, 3)
unique(x)
# 1 2 3 4 5
duplicated(x)
# FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
x[duplicated(x)]
# 1 2 3
x[!duplicated(x)]
# 1 2 3 4 5
anyDuplicated(x)
# 6

library(readxl)
mydata <- read_excel('/Users/jamesjohnson/Desktop/test.xlsx')

mydata[!(duplicated(mydata$name) & duplicated(mydata$birthday)),]

# paste()
mydata$test <- paste(mydata$name, mydata$birthday)
newdata <- mydata[!duplicated(mydata$test),]















