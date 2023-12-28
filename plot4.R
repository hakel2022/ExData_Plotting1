filename <- "C:/Users/shakizimana/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table (filename,header=TRUE,dec=".",sep=";",na.strings="?")
data_ <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(data_[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data_[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data_[, 2]))

png(filename="Plot 4.png")
par(mfrow = c(2,2))
plot(time_axis, data_[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(time_axis, data_[, 5],  ylab = "Voltage",xlab="datetime", type = "l")
plot(time_axis, data_[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis,data_[,8],col="red")
lines(time_axis,data_[,9],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.6)
plot(time_axis, data_[, 4], ylab = "Global_reactive_power",xlab="datetime", type = "l")
dev.off()