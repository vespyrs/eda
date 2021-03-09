# getting data
file <- "./Documents/comp/eda/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# plotting graph
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active <- as.numeric(subsetdata$Global_active_power)
png("./Documents/comp/eda/plot2.png")
plot(date, active, type="l", xlab="", ylab="global active power (kilowatts)")
dev.off()

