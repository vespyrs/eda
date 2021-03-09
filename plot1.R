# getting data
file <- "./Documents/comp/eda/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# plot graph
active <- as.numeric(subsetdata$Global_active_power)
png("./Documents/comp/eda/plot1.png")
hist(active, col="red", main="global active power", xlab = "global active power (kilowatts)")
dev.off()
