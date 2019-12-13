hpcdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(hpcdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subsetdates <- subset(hpcdata,hpcdata$Date=="1/2/2007" | hpcdata$Date =="2/2/2007")

#histogram
#main = "Global Active Power"
#x title= "Global Active Power (kilowatts)" 0 to 6
#y title = "Frequency" 1 to 1200
#12 red bars

#png
png("plot1.png", width=480, height=480)

#plot1
activenumeric <- as.numeric(as.character(subsetdates$Global_active_power))

hist(activenumeric, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12)

#png off
dev.off()