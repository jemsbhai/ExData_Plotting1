drawplot1 <- function() {
  dat1 <- read.csv2("household_power_consumption.txt", nrows = 200)
  dat2 <- read.csv2("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880, na.strings = "?")
  colnames(dat2) <- colnames(dat1)
  dat3<-dat2
  dat3[,"Global_active_power"]<- as.numeric(dat3[,"Global_active_power"])
  hist(dat3$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main = "Global Active Power")
  dev.copy(png,'plot1.png')
  dev.off()
  
  
  
}