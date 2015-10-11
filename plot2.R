drawplot2 <- function() {
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
  plot(dat3$datetime,dat3$GAN, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.copy(png,'plot2.png')
  dev.off()
  
}