hpcdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(hpcdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subsetdates <- subset(hpcdata,hpcdata$Date=="1/2/2007" | hpcdata$Date =="2/2/2007")

activenumeric <- as.numeric(as.character(subsetdates$Global_active_power))


#xyplot
# x = date (thur, fri, sat)
# y = "Global Active Power (kilowatts)"

#png
png("plot2.png", width=480, height=480)

#plot2
datetimenumeric <- strptime(paste(subsetdates$Date, subsetdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetimenumeric, activenumeric, type="l", xlab = " ", ylab="Global Active Power (kilowatts)")

#png off
dev.off()