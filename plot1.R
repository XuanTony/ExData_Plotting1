#read in and subset the dataset
mydata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mysub1<-subset(mydata,Date <= as.Date("2007-02-02"))
mysub2 <- subset(mysub1,Date >= as.Date("2007-02-01"))

#convert from factor to numeric
Global_active_power1<-as.numeric(levels(mysub2$Global_active_power)[mysub2$Global_active_power])

#plot
hist(Global_active_power1,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")