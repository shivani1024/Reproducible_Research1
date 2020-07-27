# The 5-minute interval that, on average, contains the maximum number of steps

max_interval <- steps_by_interval[which.max(steps_by_interval$steps),1]
max_interval
