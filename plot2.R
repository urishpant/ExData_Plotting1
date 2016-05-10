#Reading data from csv file with separator ; 
storepowerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#converting date for filter
storepowerdata$Date<-as.Date(storepowerdata$Date, format="%d/%m/%Y")
#take only required data
storepowerdata<-subset(storepowerdata,subset = (storepowerdata$Date =='2007-02-01' | storepowerdata$Date =='2007-02-02'))
#getdatetime
storepowerdata$datetime<-paste(storepowerdata$Date,storepowerdata$Time)
storepowerdata$datetime<- as.POSIXct(storepowerdata$datetime)
#plotting to png graphics device
png("plot2.png", width = 480, height = 480)
plot(storepowerdata$Global_active_power~storepowerdata$datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

 