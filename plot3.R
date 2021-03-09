# getting data
file <- "./Documents/comp/eda/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# subsetting data
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(subsetdata$Sub_metering_1)
sub2 <- as.numeric(subsetdata$Sub_metering_2)
sub3 <- as.numeric(subsetdata$Sub_metering_3)

# plotting graphy
png("./Documents/comp/eda/plot3.png")
plot(datetime, sub1, type="l", ylab="energy sub-metering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()