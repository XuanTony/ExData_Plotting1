#read in and subset the dataset
mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mysub1<-subset(mydata,Date <= as.Date("2007-02-02"))
mysub2 <- subset(mysub1,Date >= as.Date("2007-02-01"))

#convert from factor to numeric
Global_active_power1<-as.numeric(levels(mysub2$Global_active_power)[mysub2$Global_active_power])
Sub_metering_1 <-as.numeric(levels(mysub2$Sub_metering_1 )[mysub2$Sub_metering_1 ])
Sub_metering_2 <-as.numeric(levels(mysub2$Sub_metering_2 )[mysub2$Sub_metering_2 ])
Voltage <-as.numeric(levels(mysub2$Voltage )[mysub2$Voltage ])
Global_reactive_power <-as.numeric(levels(mysub2$Global_reactive_power )[mysub2$Global_reactive_power ])

par(mfrow=c(2,2))
#plot topleft
plot(mysub2$Time,Global_active_power1,type="l",xlab="",ylab="Global Active Power")

#plot topright
plot(mysub2$Time,Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot bottomleft
plot(mysub2$Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(mysub2$Time,Sub_metering_1,type="l",col="black")
points(mysub2$Time,Sub_metering_2,type="l",col="red")
points(mysub2$Time,mysub2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.35)

#plot bottomright
plot(mysub2$Time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
