library(lubridate)

file.dir1 <- "D:/interest/coursera/exploratory_data_analysis/assignment 1/exdata-data-household_power_consumption"
file.dir2 <- "D:/interest/coursera/exploratory_data_analysis/assignment 1"
setwd(file.dir2)

data <- read.table(paste(file.dir1, "household_power_consumption.txt", sep = "/"), 
                   header = T, sep = ";")
data$Date <- dmy(data$Date)
data.need <- subset(data, Date %in% list(ymd("2007-02-01"), ymd("2007-02-02")))

data.need$Global_active_power <- 
  as.numeric(as.character(data.need$Global_active_power))
data.need$Global_active_power <- 
  as.numeric(as.character(data.need$Global_active_power))

data.need$DT <- paste(data.need$Date, data.need$Time, sep = ",")
data.need$DT <- ymd_hms(data.need$DT)

setwd(paste(file.dir2, "plots", sep = "/"))

# create device and set 2x2
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow = c(2, 2))

# fig 1
with(data.need, hist(as.numeric(as.character(Global_active_power)), 
                     xlab = "Global Active Power(kilowatts)", 
                     main = "Global Active Power",
                     col = "red"))

# fig 2 
with(data.need, plot(DT, Global_active_power, type = "l", 
                     ylab = "Global Active Power(kilowatts)", 
                     main = "Global Active Power"))

# fig 3
with(data.need, plot(DT, Sub_metering_1, type = "n", 
                     xlab = "", ylab = "Energy sub metering")) 
with(data.need, points(DT, Sub_metering_1, type = "l", col = "grey")) 
with(data.need, points(DT, Sub_metering_2, type = "l", col = "red")) 
with(data.need, points(DT, Sub_metering_3, type = "l", col = "blue")) 
legend("topright", lty = c(1, 1, 1), col = c("grey", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# fig 4
with(data.need, plot(DT, Global_reactive_power, type = "l", 
                     xlab = "datetime")) 

dev.off()