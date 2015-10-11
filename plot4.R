
fpath <- "../household_power_consumption.txt"

d <- read.table(fpath, header=TRUE, sep= ";", na.strings = c("?",""))

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")

d$timetemp <- paste(d$Date, d$Time)  
d$Time <- strptime(d$timetemp, format = "%Y-%m-%d %H:%M:%S")  


d <- d[d$Date == "2007-02-01"|d$Date == "2007-02-02", ]

summary(d$Global_active_power)


leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(file="plot4.png") ## Open png device; create png file in my working directory

par(mfrow=c(2,2),mar= c(4,4,2,1),oma=c(2,0,0,0))

with(d, plot(Time,Global_active_power,
             type = "l",
             ylab= "Global Active Power (kilowatts)",
             xlab = ""
))


with(d, plot(Time,Voltage,
             type = "l", xlab = "datetime"
))

## Create plot and send to a file 
with(d, plot(Time,Sub_metering_1, type = "n",
             ylab= "Energy sub metering",
             xlab = ""))
with(subset(d),lines(Time,Sub_metering_1, col=("black")))
with(subset(d),lines(Time,Sub_metering_2, col=("red")))
with(subset(d),lines(Time,Sub_metering_3, col=("blue")))
legend("topright",lty =c(1,1),col=c("black","red","blue"),legend = leg.txt,bty = "n")


with(d, plot(Time,Global_reactive_power,
             type = "l", xlab = "datetime"
))

dev.off() ## Close the png file device

