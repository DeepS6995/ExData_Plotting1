
setwd("C:\\Users\\Deepak\\Documents\\Exploratory Data Analysis\\Week 1")
Electric <- read.table("household_power_consumption.txt", sep = ";", head= T)
### Take the subset of the data with in the given dates
Electric1 <- Electric [which (Electric$Date == "1/2/2007" | Electric$Date ==  "2/2/2007"),]

### Check the structure, to find the data types of each variable
str(Electric1)
### Change the Global_active_power to numeric
### Just chaning to numeric messes up data
### so I have to add as.character
Electric1$Global_active_power =  as.numeric(as.character(Electric1$Global_active_power))

### Make histogram
hist(Electric1$Global_active_power, main = "Global Active Power", col = 2, xlab= "Global Active Power (kilowatts)")
### Copy to PNG file
dev.copy(png, file = "Plot1.png") ## Copy my plot to a PNG file
dev.off()
