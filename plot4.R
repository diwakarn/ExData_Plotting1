rm(list=ls(all=TRUE))

fil1 = "d:/android/specdata/exeds/eds/household_power_consumption.txt"
cols <- c("date","time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )
data <- read.csv(fil1,skip= 66637, sep=";", nrows=2879, col.names = cols)

data[, "datetime"] <- as.POSIXct(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S") 
c <- levels(factor(data[,1]))
x <- weekdays(strptime(c,format = "%d/%m/%Y" ))
par(mfcol = c(2,2))
plot(data$datetime,data$Global_active_power,"l", xlab = "",ylab ="Global Active Power (kilowatts)")
plot(data$datetime,data$Sub_metering_1,"l", xlab = "",ylab ="Global Active Power (kilowatts)")
points(data$datetime,data$Sub_metering_2,"l",  col="red")
points(data$datetime,data$Sub_metering_3,"l",  col="blue")

plot(data$datetime,data$Voltage,"l", xlab = "datetime",ylab ="Voltage")
plot(data$datetime,data$Global_reactive_power,"l", xlab = "datetime",ylab ="Global Reactive Power (kilowatts)")

dev.copy(png,'plot4.png')
dev.off()