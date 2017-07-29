hpc<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = T,dec=".",stringsAsFactors = F)

##Subset the data for the two days
require(lubridate)
req_data<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
req_data$Sub_metering_1<-as.numeric(req_data$Sub_metering_1)
req_data$Sub_metering_2<-as.numeric(req_data$Sub_metering_2)
req_data$Sub_metering_3<-as.numeric(req_data$Sub_metering_3)
req_data$dt<-paste(req_data$Date,req_data$Time)
req_data<-na.omit(req_data)
req_data$dt<-dmy_hms(req_data$dt)
attach(req_data)

##Constructing the Graph
png("plot4.png", height = 480,width = 480)
par(mfrow=c(2,2))
##(1,1)
plot(Global_active_power~dt,type="l",xlab="",ylab="Global Active Power (kilowatts)")
##(1,2)
plot(Voltage~dt,type="l",xlab="datetime",ylab="Voltage")
##(2,1)
plot(dt,Sub_metering_1,type="l",xlab = "",
     ylab="Energy sub metering",col="black")
lines(dt,Sub_metering_2,type="l",col="red")
lines(dt,Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd = 2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##(2,2)
plot(Global_reactive_power~dt,type="l",xlab="datetime",ylab="Global_Active_Power")

dev.off()