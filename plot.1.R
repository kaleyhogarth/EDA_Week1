raw<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
data<-raw
data$Date<-as.Date(data$Date)
data<-data %>% filter((Date== "2007-02-01")|(Date=="2007-02-02"))

plot.1<-data %>% select(Active.Power=Global_active_power)
plot.1$Active.Power<-as.numeric(as.character(plot.1$Active.Power))

png(file="plot.1.png", width=480, height=480)

hist(plot.1$Active.Power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()