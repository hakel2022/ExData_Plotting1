filename <- "C:/Users/shakizimana/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table (filename,header=TRUE,dec=".",sep=";",na.strings="?")
data_ <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
png(filename="Plot 1.png")
hist(data_[,3],col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()