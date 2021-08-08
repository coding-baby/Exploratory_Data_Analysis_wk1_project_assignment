
raw <- read.table("household_power_consumption.txt", header = T, sep = ";") ### reading raw data
df <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007") ### selecting the data of interest

rm(raw) ### remove the raw data

df$Date <- as.Date(df$Date, format = "%d/%m/%Y") ### convert character to class "Date"
df$Time <- strptime(df$Time, format = "%H:%M:%S" ) ### convert character to class "POSIXlt"
df[1:1440,"Time"] <- format(df[1:1440,"Time"],"2007-02-01 %H:%M:%S") ### insert ymd to Time
df[1441:2880,"Time"] <- format(df[1441:2880,"Time"],"2007-02-02 %H:%M:%S") ### insert ymd to Time


df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 < as.numeric(df$Sub_metering_3)


###


png(filename = "./Plot2.png",width = 480, height = 480, units = "px") ### set device

plot(df$Time, df$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
)

dev.off() ### close device

