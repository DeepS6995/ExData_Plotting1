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


### Plotting a line chart Time vs Submetering



plot(Electric2$DateTime, Electric2$Sub_metering_1, 
    type="l", ylab= "Electric Sub Metering", xlab= "")
lines(Electric2$DateTime, Electric2$Sub_metering_2, col= 2)
lines(Electric2$DateTime, Electric2$Sub_metering_3, col=4)
legend("topright",pch="_",  col= c(1,2,4), legend= c("sub_metering_1", "sub_metering_2", "sub_metering_3"), cex=.8, inset=.05, bty= "n")

### Copy to PNG file
dev.copy(png, file = "Plot3.png") ### Copy my plot to a PNG file
dev.off()
help(legend)
?par
?legend()
