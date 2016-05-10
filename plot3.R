#Reading data from csv file with separator ; 
storepowerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert date for filter
storepowerdata$Date<-as.Date(storepowerdata$Date, format="%d/%m/%Y")
#take only required data
storepowerdata<-subset(storepowerdata,subset = (storepowerdata$Date =='2007-02-01' | storepowerdata$Date =='2007-02-02'))
#get datetime
storepowerdata$datetime<-paste(storepowerdata$Date,storepowerdata$Time)
storepowerdata$datetime<- as.POSIXct(storepowerdata$datetime)
 
#plot to png device
png("plot3.png", width = 480, height = 480)
with(storepowerdata,plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(storepowerdata,lines(datetime, as.numeric(Sub_metering_2), col="red"))
with(storepowerdata,lines(datetime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()

 