# coursera-exploratory-data-analysis-course-project-1
# Plot 1: Global Active Power Vs. Frequency

#Reading data table
Source <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

#defining dates in dataset
Source$Date <- as.Date(Source$Date, format="%d/%m/%Y")

#Subsetting data 
data <- subset(Source, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Plotting data and copy it to file
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()