filename <- "C:/Users/shakizimana/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table (filename,header=TRUE,dec=".",sep=";",na.strings="?")
data_ <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(data_[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data_[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data_[, 2]))
png(filename="Plot 2.png")
plot(time_axis, data_[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()