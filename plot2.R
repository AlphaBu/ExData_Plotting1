dat<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
dat$Date<-as.Date(as.character(dat$Date),format="%d/%m/%Y")
dat<-subset(dat,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

dat$Global_active_power<-as.double(as.character(dat$Global_active_power))
dat$Time<-strptime(paste(as.character(dat$Date),as.character(dat$Time)),format="%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(dat$Time,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()

