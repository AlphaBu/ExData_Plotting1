dat<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
dat$Date<-as.Date(as.character(dat$Date),format="%d/%m/%Y")
dat<-subset(dat,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

dat$Global_active_power<-as.double(as.character(dat$Global_active_power))
png("plot1.png",width=480,height=480)
hist(dat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()

