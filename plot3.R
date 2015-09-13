plot3 <- function() {

## read in power consumption data
df <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings="?", stringsAsFactors=F)

## add additional column called 'datetime' which combines date and time and converts to date class
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, format="%d/%m/%Y %H:%M:%S")

## subset the data for the two days and omit any incomplete cases
dfsub <- df[df$datetime>="2007-02-01 00:00:00" & df$datetime<="2007-02-02 23:59:00",]
dfsub <- na.omit(dfsub)

## create plot
png("plot3.png")    
    
plot(x = dfsub$datetime, y = dfsub$Sub_metering_1, 
     type="n", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(x = dfsub$datetime, y = dfsub$Sub_metering_1, col = 'black')
lines(x = dfsub$datetime, y = dfsub$Sub_metering_2, col = 'red')
lines(x = dfsub$datetime, y = dfsub$Sub_metering_3, col = 'blue')

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1,1),
        lwd = c(2.5, 2.5, 2.5), 
        col = c(1, 2, 3))

dev.off()
}
