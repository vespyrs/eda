# getting data
file <- "./Documents/comp/eda/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# subsetting data
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(subsetdata$Sub_metering_1)
sub2 <- as.numeric(subsetdata$Sub_metering_2)
sub3 <- as.numeric(subsetdata$Sub_metering_3)
volt <- as.numeric(subsetdata$Voltage)
reactive <- as.numeric(subsetdata$Global_reactive_power)

# plotting
png("./Documents/comp/eda/plot4.png")
par(mfrow = c(2, 2)) 

plot(date, active, type="l", xlab="", ylab="global active power")
plot(date, volt, type="l", xlab="datetime", ylab="Voltage")

plot(date, sub1, type="l", ylab="energy submetering", xlab="")
lines(date, sub2, type="l", col="red")
lines(date, sub3, type="l", col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"), bty="o")
plot(date, reactive, type="l", xlab="datetime", ylab="global reactive power")
dev.off()