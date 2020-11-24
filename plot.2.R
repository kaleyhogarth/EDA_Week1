raw<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
data<-raw
data$Date<-as.Date(data$Date)
data<-data %>% filter((Date== "2007-02-01")|(Date=="2007-02-02"))

plot.2<-data %>% select(Date,Time,Global=Global_active_power)
plot.2$Global<-as.numeric(as.character(plot.2$Global))
plot.2<-plot.2 %>% mutate(Weekday=weekdays(Date), Day_Time=as.POSIXct(paste(plot.2$Date, plot.2$Time), format="%Y-%m-%d %H:%M:%S"))

png(file="plot.2.png", width=480, height=480)

plot(plot.2$Day_Time, plot.2$Global, type= "l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.off()