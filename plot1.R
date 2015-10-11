
fpath <- "../household_power_consumption.txt"

d <- read.table(fpath, header=TRUE, sep= ";", na.strings = c("?",""))

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")

d$timetemp <- paste(d$Date, d$Time)  
d$Time <- strptime(d$timetemp, format = "%Y-%m-%d %H:%M:%S")  


d <- d[d$Date == "2007-02-01"|d$Date == "2007-02-02", ]

summary(d$Global_active_power)

png(file="plot1.png") ## Open png device; create png file in my working directory
## Create plot and send to a file 
with(d, hist(Global_active_power, 
             freq = TRUE,
             col = "red" ,
             xlab= "Global Active Power (kilowatts)",
             main = "Global Active Power"))
dev.off() ## Close the png file device





