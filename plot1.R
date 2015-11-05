
# Plotting for Course Project1 plot 1

rm(list=ls(all=TRUE))

fil1 = "d:/android/specdata/exeds/eds/household_power_consumption.txt"
cols <- c("date","time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )
data <- read.csv(fil1,skip= 66637, sep=";", nrows=2879, col.names = cols)
 
hist(data$Global_active_power,col="red")

dev.copy(png,'plot1.png')
dev.off()

 