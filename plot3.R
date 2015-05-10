#read in and subset the dataset
mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mysub1<-subset(mydata,Date <= as.Date("2007-02-02"))
mysub2 <- subset(mysub1,Date >= as.Date("2007-02-01"))

#convert from factor to numeric
Sub_metering_1 <-as.numeric(levels(mysub2$Sub_metering_1 )[mysub2$Sub_metering_1 ])
Sub_metering_2 <-as.numeric(levels(mysub2$Sub_metering_2 )[mysub2$Sub_metering_2 ])

#plot
plot(mysub2$Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(mysub2$Time,Sub_metering_1,type="l",col="black")
points(mysub2$Time,Sub_metering_2,type="l",col="red")
points(mysub2$Time,mysub2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))