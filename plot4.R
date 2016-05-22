dat<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
dat$Date<-as.Date(as.character(dat$Date),format="%d/%m/%Y")
dat<-subset(dat,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

dat$Global_active_power<-as.double(as.character(dat$Global_active_power))
dat$Global_reactive_power<-as.double(as.character(dat$Global_reactive_power))
dat$Time<-strptime(paste(as.character(dat$Date),as.character(dat$Time)),format="%Y-%m-%d %H:%M:%S")
dat$Voltage<-as.double(as.character(dat$Voltage))

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(dat$Time,dat$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(dat$Time,dat$Voltage,xlab="datatime",ylab="Voltage",type="l")
plot(dat$Time,dat$Sub_metering_1,type="n",xlab="",ylab="Energe sub metering")
points(dat$Time,dat$Sub_metering_1,type="l",lwd=1)
points(dat$Time,dat$Sub_metering_2,type="l",lwd=1,col="red")
points(dat$Time,dat$Sub_metering_3,type="l",lwd=1,col="blue")
legend("topright",pch=c("-","-","-"),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dat$Time,dat$Global_reactive_power,xlab="",ylab="Global Active Power",type="l")

dev.off()



