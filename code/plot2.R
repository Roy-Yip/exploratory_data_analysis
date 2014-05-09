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

data.need$DT <- paste(data.need$Date, data.need$Time, sep = ",")
data.need$DT <- ymd_hms(data.need$DT)

setwd(paste(file.dir2, "plots", sep = "/"))

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
with(data.need, plot(DT, Global_active_power, type = "l", 
                     ylab = "Global Active Power(kilowatts)", 
                     main = "Global Active Power"))
dev.off()
