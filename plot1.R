##Read the data
hpc<-read.table("household_power_consumption.txt",sep=";",header = T,dec=".",stringsAsFactors = F)
View(hpc)
##Subset the data for the two days
req_data<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]

##convert to numeric so that it can be plotted
req_data$Global_active_power<-as.numeric(req_data$Global_active_power)
req_data<-na.omit(req_data)
##Start the png Device and plot
png("plot1.png",height = 480, width = 480)
hist(req_data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
