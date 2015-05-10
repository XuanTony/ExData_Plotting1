#read in and subset the dataset
mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d/%m/%Y %H:%M:%S")
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mysub1<-subset(mydata,Date <= as.Date("2007-02-02"))
mysub2 <- subset(mysub1,Date >= as.Date("2007-02-01"))

#convert from factor to numeric
Global_active_power1<-as.numeric(levels(mysub2$Global_active_power)[mysub2$Global_active_power])

#plot
plot(mysub2$Time,Global_active_power1,type="l",xlab="",ylab="Global Active Power(kilowatts)")