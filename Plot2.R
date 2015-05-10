getwd()
Electric <- read.table("household_power_consumption.txt", sep = ";", head= T)
### Take the subset of the data with in the given dates
Electric2 <- Electric [which (Electric$Date == "1/2/2007" | Electric$Date ==  "2/2/2007"),]
## Check Data
head(Electric2)
str(Electric2)
View(Electric2)

## Change the class of variables from factor to numeric
## These variables are required for plotting
Electric2$Global_active_power =  as.numeric(as.character(Electric2$Global_active_power))
Electric2$Global_reactive_power =  as.numeric(as.character(Electric2$Global_reactive_power))
Electric2$Voltage =  as.numeric(as.character(Electric2$Voltage))
Electric2$Sub_metering_2 =  as.numeric(as.character(Electric2$Sub_metering_2))
Electric2$Sub_metering_1 =  as.numeric(as.character(Electric2$Sub_metering_1))
## Make a seperate column for data and time combined
Electric2$DateTime <- paste(Electric2$Date, Electric2$Time) 

### Change the variable using strptime function
Electric2$DateTime<- strptime(as.character(Electric2$DateTime),"%d/%m/%Y %H:%M:%S")

### Change the variable using strptime function
class(Electric2$DateTime)
### Plotting a line chart Time vs Global Active Power
plot(Electric2$DateTime, Electric2$Global_active_power, type="l", ylab= "Global Active Power (Kilowatts)", xlab= "")
### Copy to PNG file
dev.copy(png, file = "Plot2.png") ### Copy my plot to a PNG file
dev.off()
