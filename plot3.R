hpcdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(hpcdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subsetdates <- subset(hpcdata,hpcdata$Date=="1/2/2007" | hpcdata$Date =="2/2/2007")

activenumeric <- as.numeric(as.character(subsetdates$Global_active_power))

#xy plot
#x=day thur fri sat
#y= "Energy sub metering" 0 to 40
#legend
#Sub_metering_1 black
#Sub_metering_2 red
#Sub_metering_3 blue

#png
png("plot3.png", width=480, height=480)

#plot3
datetimenumeric <- strptime(paste(subsetdates$Date, subsetdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub1numeric <- as.numeric(as.character(subsetdates$Sub_metering_1))

sub2numeric <- as.numeric(as.character(subsetdates$Sub_metering_2))

sub3numeric <- as.numeric(as.character(subsetdates$Sub_metering_3))

plot(datetimenumeric, sub1numeric, type="l", xlab = " ", ylab="Energy sub metering")

lines(datetimenumeric, sub2numeric, type="l", col="red")

lines(datetimenumeric, sub3numeric, type="l", col="blue")

legendtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", legendtext, lty = 1, lwd = 2, col = c("black", "red", "blue"))

#png off
dev.off()
