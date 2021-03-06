drawplot4 <- function() {
  dat1 <- read.csv2("household_power_consumption.txt", nrows = 200)
  dat2 <- read.csv2("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880, na.strings = "?")
  colnames(dat2) <- colnames(dat1)
  dat3<-dat2
  dat3$GAN <- as.character(dat3$Global_active_power)
  dat3$GAN <- as.numeric(dat3$GAN)
  dat3$Date2 <- as.Date(dat3$Date,"%d/%m/%Y")
  dat3$dayofweek <- weekdays(dat3$Date2)
  x <- paste(dat3$Date2, dat3$Time)
  dat3$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
  dat3$sm1 <- as.numeric(as.character(dat3$Sub_metering_1))
  dat3$sm2 <- as.numeric(as.character(dat3$Sub_metering_2))
  dat3$sm3 <- as.numeric(as.character(dat3$Sub_metering_3))
  dat3$Volts <- as.character(dat3$Voltage)
  dat3$Volts <- as.numeric(dat3$Volts)
  dat3$GRP <- as.character(dat3$Global_reactive_power)
  dat3$GRP <- as.numeric(dat3$GRP)
  
  par(mfrow=c(2,2))
  
  plot(dat3$datetime,dat3$GAN, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

  plot(dat3$datetime,dat3$Volts, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(dat3$datetime,dat3$sm1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(dat3$datetime,dat3$sm3, type = "l", col = "blue")
  lines(dat3$datetime,dat3$sm2, type = "l", col = "red")
  legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

  plot(dat3$datetime,dat3$GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.copy(png,'plot4.png')
  dev.off()
  
}