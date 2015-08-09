# coursera-exploratory-data-analysis-course-project-1
# Plot 4: Multiple Plots

#Reading data table
Source <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#defining dates in dataset
Source$Date <- as.Date(Source$Date, format="%d/%m/%Y")

#Subsetting data 
data <- subset(Source, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting data, add lines and legend and copy it to file
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data,{
        plot(data$Datetime, data$Global_active_power, type="l", 
             xlab=" ", ylab="Global Active Power (kilowatts)")
        
        plot(data$Datetime, data$Voltage, type="l", 
             xlab="datetime", ylab="Voltage")
        
        plot(data$Datetime, data$Sub_metering_1, col="black", type="l", 
             xlab=" ", ylab="Energy sub metering")
        lines(data$Datetime, data$Sub_metering_2, col="red", type="l")
        lines(data$Datetime, data$Sub_metering_3, col="blue", type="l")
        
        plot(data$Datetime, data$Global_reactive_power, type="l", 
             xlab="datetime", ylab="Global_reactive_power")

})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
