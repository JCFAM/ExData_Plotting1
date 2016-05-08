library(plyr)
Householdcolnames <- read.table("household_power_consumption.txt",sep = ';',header = TRUE,nrow =2)
Householdcon <- read.table("household_power_consumption.txt",sep = ';',skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows = 2879)
names(Householdcon) <- names(Householdcolnames )
f <- strptime(paste(as.character(as.Date( as.character(Householdcon$Date),"%d/%m/%Y")),as.character(Householdcon$Time)), "%Y-%m-%d %H:%M:%S")
newhouseHold <- mutate(Householdcon,DateTime = f)
png("plot1.png")
hist(newhouseHold$Global_active_power,col= "red",main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()


