#Reading data from csv file with separator ; 
storepowerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert date for filter
storepowerdata$Date<-as.Date(storepowerdata$Date, format="%d/%m/%Y")
#taking only required data from given datasets
storepowerdata<-subset(storepowerdata,subset = (storepowerdata$Date =='2007-02-01' | storepowerdata$Date =='2007-02-02'))
#getting datetime
storepowerdata$datetime<-paste(storepowerdata$Date,storepowerdata$Time)
storepowerdata$datetime<- as.POSIXct(storepowerdata$datetime)

#plotting to png graphics device
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2)) 
#1 Active power
with(storepowerdata,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))
#2 Voltage
with(storepowerdata,plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#3Plotting submetering
with(storepowerdata,plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(storepowerdata,lines(datetime, as.numeric(Sub_metering_2), col="red"))
with(storepowerdata,lines(datetime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
#4Reactive power
with(storepowerdata,plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
 
dev.off()

