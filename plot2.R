plot2 <- function() {

## read in power consumption data
df <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings="?", stringsAsFactors=F)

## add additional column called 'datetime' which combines date and time and converts to date class
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, format="%d/%m/%Y %H:%M:%S")

## subset the data for the two days and omit any incomplete cases
dfsub <- df[df$datetime>="2007-02-01 00:00:00" & df$datetime<="2007-02-02 23:59:00",]
dfsub <- na.omit(dfsub)

## create plot
png("plot2.png")    
    
plot(x = dfsub$datetime, y = dfsub$Global_active_power,
    type = "l", 
    xlab = "", 
    ylab = "Global Active Power (kilowatts)")

dev.off()
}