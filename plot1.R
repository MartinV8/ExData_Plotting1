  ## First I Write the relevant subset into a smaller file, so there aren't memory issues

  wholedata<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=T, colClasses ="character")
  datedata<- subset(wholedata, wholedata$Date =="1/2/2007" | wholedata$Date =="2/2/2007")
  write.table(datedata, file="EDA_power.csv", col.names=T, sep = ",")
  
  ## Import the relevant data and create the histogram
  
  data <- read.csv("EDA_power.csv", header=T)
  hist(as.numeric(data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)" ,ylab = "Frequency", col="red")
  dev.copy(png, file="plot1.png")
  dev.off()
  