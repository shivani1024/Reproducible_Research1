# Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends

#Calculate Mean

rmeantotal <- mean(StepsTotalUnion$steps)
rmeantotal

#Calculate Median
rmediantotal <- median(StepsTotalUnion$steps)
rmediantotal


#Check if these values differ from the estimates from the first part of the assignment

rmediandiff <- rmediantotal - rmedian
rmediandiff

rmeandiff <- rmeantotal - rmean
rmeandiff

#Are there differences in activity patterns between weekdays and weekends?

weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", 
              "Friday")
new_activity$dow = as.factor(ifelse(is.element(weekdays(as.Date(new_activity$date)),weekdays), "Weekday", "Weekend"))
StepsTotalUnion <- aggregate(steps ~ interval + dow, new_activity, mean)
library(lattice)
xyplot(StepsTotalUnion$steps ~ StepsTotalUnion$interval|StepsTotalUnion$dow, main="Average Steps per Day by Interval",xlab="Interval", ylab="Steps",layout=c(1,2), type="l")
