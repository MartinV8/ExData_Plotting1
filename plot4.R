## Same procedure for preparing the data as in plot2.R

data <- read.csv("EDA_power.csv", header=T, colClasses = "character")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$times <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

## Open the plot device to print to the file directly
## Create a graph for four plots

png(filename="plot4.png")
par(mfrow = c(2,2))

## Plot 1

plot(data$times, data[,3], type="l", xlab ="", ylab ="Global Active Power")

## Plot 2

plot(data$times, data[,5], type="l", xlab ="datetime", ylab ="Voltage")

## Plot 3

plot(data$times, as.numeric(data[,7]), type="l", xlab ="", ylab ="Energy sub metering")
lines(data$times, as.numeric(data[,8]), col="red")
lines(data$times, as.numeric(data[,9]), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

## Plot 4

plot(data$times, data[,4], type="l", xlab ="datetime", ylab ="Global_reactive_power")


dev.off()
Sys.setlocale(locale = "")