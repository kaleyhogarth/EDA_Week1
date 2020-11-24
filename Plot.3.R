raw<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
data<-raw
data$Date<-as.Date(data$Date)
data<-data %>% filter((Date== "2007-02-01")|(Date=="2007-02-02"))

plot.3<-data %>% select(Date, Time, Sub.1=Sub_metering_1, Sub.2=Sub_metering_2, Sub.3=Sub_metering_3)
plot.3$Sub.1<-as.numeric(as.character(plot.3$Sub.1))
plot.3$Sub.2<-as.numeric(as.character(plot.3$Sub.2))

plot.3<-plot.3 %>% mutate(Weekday=weekdays(Date), Day_Time=as.POSIXct(paste(plot.3$Date, plot.3$Time), format="%Y-%m-%d %H:%M:%S"))

png(file="plot.3.png", width=480, height=480)

plot(plot.3$Day_Time, plot.3$Sub.1, type= "l", xlab=" ", ylab="Global Active Power (kilowatts)")+ lines(plot.3$Day_Time,plot.3$Sub.2, col="red")+lines(plot.3$Day_Time,plot.3$Sub.3, col="blue")  +legend("topright", legend=c("Sub.1", "Sub.2", "Sub.3"), col=c("black", "red", "blue"), lty = c(1,1,1), cex=1.2)

dev.off()