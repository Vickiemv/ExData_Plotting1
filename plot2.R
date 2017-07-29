##Read the data
hpc<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = T,dec=".",stringsAsFactors = F)

##Subset the data for the two days
require(lubridate)
req_data<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
req_data$dt<-paste(req_data$Date,req_data$Time)
req_data<-na.omit(req_data)
req_data$dt<-dmy_hms(req_data$dt)
attach(req_data)

##Constructing the Graph
png("plot2.png",width = 480,height = 480)
plot(Global_active_power~dt,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
detach(req_data)
