hpcdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(hpcdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subsetdates <- subset(hpcdata,hpcdata$Date=="1/2/2007" | hpcdata$Date =="2/2/2007")

activenumeric <- as.numeric(as.character(subsetdates$Global_active_power))

#4 plots in one
# plotA is plot2
#plotB is y = voltage, x = thur fri sat
#plotC is plot3
#plotD is x = thur fri sat, y= Global_reactive_power

#png 
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

#plotA
datetimenumeric <- strptime(paste(subsetdates$Date, subsetdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetimenumeric, activenumeric, type="l", xlab = " ", ylab="Global Active Power")


#plotB
voltagenumeric <- as.numeric(as.character(subsetdates$Voltage))

plot(datetimenumeric, voltagenumeric, type="l", xlab = "datetime", ylab="Voltage")

#plotC
datetimenumeric <- strptime(paste(subsetdates$Date, subsetdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub1numeric <- as.numeric(as.character(subsetdates$Sub_metering_1))

sub2numeric <- as.numeric(as.character(subsetdates$Sub_metering_2))

sub3numeric <- as.numeric(as.character(subsetdates$Sub_metering_3))

plot(datetimenumeric, sub1numeric, type="l", xlab = " ", ylab="Energy sub metering")

lines(datetimenumeric, sub2numeric, type="l", col="red")

lines(datetimenumeric, sub3numeric, type="l", col="blue")

legendtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", legendtext, lty = 1, lwd = 2, col = c("black", "red", "blue"))

#plotD
reactivenumeric <- as.numeric(as.character(subsetdates$Global_reactive_power))

plot(datetimenumeric, reactivenumeric, type="l", xlab = "datetime", ylab="Global_reactive_power")

#end png
dev.off()