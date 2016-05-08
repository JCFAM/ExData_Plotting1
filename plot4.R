library(plyr)
Householdcolnames <- read.table("household_power_consumption.txt",sep = ';',header = TRUE,nrow =2)
Householdcon <- read.table("household_power_consumption.txt",sep = ';',skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows = 2879)
names(Householdcon) <- names(Householdcolnames )
f <- strptime(paste(as.character(as.Date( as.character(Householdcon$Date),"%d/%m/%Y")),as.character(Householdcon$Time)), "%Y-%m-%d %H:%M:%S")
newhouseHold <- mutate(Householdcon,DateTime = f)

globalActivePower <- as.numeric(newhouseHold$Global_active_power)
globalReactivePower <- as.numeric(newhouseHold$Global_reactive_power)
voltage <- as.numeric(newhouseHold$Voltage)
subMetering1 <- as.numeric(newhouseHold$Sub_metering_1)
subMetering2 <- as.numeric(newhouseHold$Sub_metering_2)
subMetering3 <- as.numeric(newhouseHold$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(f, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(f, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(f, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(f, subMetering2, type="l", col="red")
lines(f, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(f, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()








 

