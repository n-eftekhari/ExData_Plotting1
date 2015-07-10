
##Downloading and unzipping the data into working directory
if(!file.exists("exdata-data-household_power_consumption.zip")) {
        tempfile <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempfile)
        data <- unzip(tempfile)
        unlink(tempfile)
}
##processing the data and putting every attribute in the right format
data <- read.table(data, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
d <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Time <- strptime(d$Time, format="%H:%M:%S")
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))
##Drawing the plot on screen then saving to .png file
plot1 <- function() {
        hist(d$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
}
plot1() ##calling the function saves plot1.png in the working directory
