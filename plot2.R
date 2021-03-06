#Reading the dataset. This function also subsets to the relevant datapoints:data dated b/n 1/2/2007 and 2/2/2007

household_power_consumption <- read.table(text = grep("^[1,2]/2/2007", readLines("~/datasciencecoursera/household_power_consumption.txt"), value = TRUE), sep=";", quote="\"", na.strings="?", stringsAsFactors=FALSE)
colnames(household_power_consumption)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

#converting the date formats to Date/Time classes
new_time<-paste(household_power_consumption$Date,household_power_consumption$Time)
household_power_consumption$new_time <-strptime(new_time, "%d/%m/%Y %H:%M:%S")

#Plotting timeseries - Plot 2
plot(household_power_consumption$new_time, household_power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off() 