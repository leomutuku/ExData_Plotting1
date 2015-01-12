#Reading the dataset. This function also subsets to the relevant datapoints:data dated b/n 1/2/2007 and 2/2/2007

household_power_consumption <- read.table(text = grep("^[1,2]/2/2007", readLines("~/datasciencecoursera/household_power_consumption.txt"), value = TRUE), sep=";", quote="\"", na.strings="?", stringsAsFactors=FALSE)
colnames(household_power_consumption)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

#converting the date formats to Date/Time classes
new_time<-paste(household_power_consumption$Date,household_power_consumption$Time)
household_power_consumption$new_time <-strptime(new_time, "%d/%m/%Y %H:%M:%S")


#Plotting multiple graphics on a screen - Plot 4
par(mfrow = c(2, 2), mar=c(4,4,2,1))
with(household_power_consumption, {
        plot(new_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(new_time, Voltage, type = "l", xlab= "datetime")
        plot(new_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(new_time, Sub_metering_2, col = "red")
        lines(new_time, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(new_time, Global_reactive_power, type = "l", xlab= "datetime")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off() 