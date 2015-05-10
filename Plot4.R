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


## Plot four graphs as required
## Making four spaces for four graphs
par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(Electric2, {
        ## first graph
        plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power")
        ## second graph
        plot(DateTime, Voltage, type = "l", ylab = "Voltage")
        ## third graph, it has three lines a a legend
        plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering")
        lines(DateTime,Sub_metering_2, col= 2)
        lines(DateTime,Sub_metering_3, col=4)
        legend("topright",pch="_",  col= c(1,2,4), legend= c("sub_metering_1", "sub_metering_2", "sub_metering_3"), cex=.4, inset=.05, bty= "n")
        ## fourth graph
        plot(DateTime, Global_reactive_power, type = "l", ylab = "Global reactive power")
        
})
### Copy to PNG file
dev.copy(png, file = "Plot4.png") ### Copy my plot to a PNG file
dev.off()



