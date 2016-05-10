#Reading data from csv file with separator ; 
storepowerdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#converting date for filter
storepowerdata$Date<-as.Date(storepowerdata$Date, format="%d/%m/%Y")
#taking only data that is required from the given datasets
storepowerdata<-subset(storepowerdata,subset = (storepowerdata$Date =='2007-02-01' | storepowerdata$Date =='2007-02-02'))
#plotting to png graphics device
png("plot1.png", width = 480, height = 480)
hist(storepowerdata$Global_active_power ,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

 