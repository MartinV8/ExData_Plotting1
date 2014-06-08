## Note that we created a small file with the data of the two relevant days in plot1.R
## We import the data from that smaller file.

data <- read.csv("EDA_power.csv", header=T, colClasses = "character")

## To be able to create a time series plot, we need to combine (paste) the variables "Date" and "Time". 
## It is necessary to change the variable class of "Date" from "character" to "Date".

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$times <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## Setting the language to "English"

Sys.setlocale("LC_TIME", "English")

## Create the plot

plot(data$times, data[,3], type="l", xlab ="", ylab ="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()

Sys.setlocale(locale = "")