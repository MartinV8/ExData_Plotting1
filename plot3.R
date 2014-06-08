## Same procedure for preparing the data as in plot2.R

data <- read.csv("EDA_power.csv", header=T, colClasses = "character")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$times <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

## Open the plot device to print to the file directly

png(filename="plot3.png")

## Create the plot with "Sub_metering_1" first, then add the other two variables and the legend

plot(data$times, as.numeric(data[,7]), type="l", xlab ="", ylab ="Energy sub metering")
lines(data$times, as.numeric(data[,8]), col="red")
lines(data$times, as.numeric(data[,9]), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()
Sys.setlocale(locale = "")