raw<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
data<-raw
data$Date<-as.Date(data$Date)
data<-data %>% filter((Date== "2007-02-01")|(Date=="2007-02-02"))

png(file="plot.4.png", width=480, height=480)

par(mfrow=c(2,2))

plot.1<-data %>% select(Active.Power=Global_active_power)
plot.1$Active.Power<-as.numeric(as.character(plot.1$Active.Power))
hist(plot.1$Active.Power, main=" ", xlab="Global Active Power (kilowatts)", col="red")

plot.2<-data %>% select(Date,Time,Global=Global_active_power)
plot.2$Global<-as.numeric(as.character(plot.2$Global))
plot.2<-plot.2 %>% mutate(Weekday=weekdays(Date), Day_Time=as.POSIXct(paste(plot.2$Date, plot.2$Time), format="%Y-%m-%d %H:%M:%S"))
plot(plot.2$Day_Time, plot.2$Global, type= "l", xlab=" ", ylab="Global Active Power (kilowatts)")

plot.3<-data %>% select(Date, Time, Sub.1=Sub_metering_1, Sub.2=Sub_metering_2, Sub.3=Sub_metering_3)
plot.3$Sub.1<-as.numeric(as.character(plot.3$Sub.1))
plot.3$Sub.2<-as.numeric(as.character(plot.3$Sub.2))
plot.3<-plot.3 %>% mutate(Weekday=weekdays(Date), Day_Time=as.POSIXct(paste(plot.3$Date, plot.3$Time), format="%Y-%m-%d %H:%M:%S"))
plot(plot.3$Day_Time, plot.3$Sub.1, type= "l", xlab=" ", ylab="Global Active Power (kilowatts)")+ lines(plot.3$Day_Time,plot.3$Sub.2, col="red")+lines(plot.3$Day_Time,plot.3$Sub.3, col="blue")  

plot.4<-data %>% select(Date,Time,Global.Reactive=Global_reactive_power)
plot.4$Global.Reactive<-as.numeric(as.character(plot.4$Global.Reactive))
plot.4<-plot.4 %>% mutate(Weekday=weekdays(Date), Day_Time=as.POSIXct(paste(plot.4$Date, plot.4$Time), format="%Y-%m-%d %H:%M:%S"))
plot(plot.4$Day_Time, plot.4$Global.Reactive, type= "l", xlab=" ", ylab="Global_reactive_power")

dev.off()
