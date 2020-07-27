# Code to describe and show a strategy for imputing missing data

# Report total no. of missing values
NATotal <- sum(!complete.cases(data))
NATotal

# Used Mean for the day compute missing values
StepsAverage <- aggregate(steps ~ interval, data = data, FUN = mean)
fillNA <- numeric()
for (i in 1:nrow(data)) {
    obs <- data[i, ]
    if (is.na(obs$steps)) {
        steps <- subset(StepsAverage, interval == obs$interval)$steps
    } else {
        steps <- obs$steps
    }
    fillNA <- c(fillNA, steps)
}


#Create a new dataset including the imputed missing values
new_activity <- data
new_activity$steps <- fillNA
