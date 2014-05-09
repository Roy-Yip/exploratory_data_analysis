library(lubridate)

# set the directory
file.dir1 <- "D:/interest/coursera/exploratory_data_analysis/assignment 1/exdata-data-household_power_consumption"
file.dir2 <- "D:/interest/coursera/exploratory_data_analysis/assignment 1"
setwd(file.dir2)

# read data
data <- read.table(paste(file.dir1, "household_power_consumption.txt", sep = "/"), 
                   header = T, sep = ";")
data$Date <- dmy(data$Date)
data.need <- subset(data, Date %in% list(ymd("2007-02-01"), ymd("2007-02-02")))

setwd(paste(file.dir2, "plots", sep = "/"))
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)
with(data.need, hist(as.numeric(as.character(Global_active_power)), 
                              xlab = "Global Active Power(kilowatts)", 
                              main = "Global Active Power",
                              col = "red"))
dev.off()
     
     
