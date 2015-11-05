######################################################
# Program Plot #2 course project 1
#########################################################
rm(list=ls(all=TRUE))
par(mfcol = c(1,1))
fil1 = "d:/android/specdata/exeds/eds/household_power_consumption.txt"
cols <- c("date","time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )
data <- read.csv(fil1,skip= 66637, sep=";", nrows=2879, col.names = cols)

data[, "datetime"] <- as.POSIXct(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S") 
c <- levels(factor(data[,1]))
x <- weekdays(strptime(c,format = "%d/%m/%Y" ))

plot(data$datetime,data$Global_active_power,"li", xlab = "",ylab ="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()