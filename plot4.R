#Set Working Directory

setwd("~/Coursera/R Specialization/4. Exporatory Data Anallysis/Week 1
      /ExData_Plotting1_DMK")

#Read data into R

power_data <- 
  read.table("household_power_consumption.txt",skip=1,sep=";")

#Assing names to variables

names(power_data) <- 
  c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subsetting data only for 1/2/2007-2/2/2007 and setting variables as numeric
#As well as dates and times set to their specific categories

power_data1 <- subset(power_data,power_data$Date=="1/2/2007" | 
                        power_data$Date =="2/2/2007")
power_data1$Global_active_power<- as.numeric(power_data1$Global_active_power)
power_data1$Date <- as.Date(power_data1$Date, format="%d/%m/%Y")
power_data1$Time <- strptime(power_data1$Time, format="%H:%M:%S")
power_data1[1:1440,"Time"] <- 
  format(power_data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_data1[1441:2880,"Time"] <- 
  format(power_data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot commands

par(mfrow= c(2,2))

#Plot 1

plot(power_data1$Time, power_data1$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)") 

#Plot 2

plot(power_data1$Time, power_data1$Voltage, type="l", 
     xlab="datetime", ylab= "Voltage", col= "black")

#Plot 3

plot(power_data1$Time, power_data1$Sub_metering_1, type="n", 
     xlab="", ylab= "Energy sub metering")
with(power_data1, lines(Time, Sub_metering_1, col="black"))
with(power_data1, lines(Time, Sub_metering_2, col="red"))
with(power_data1, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), 
    legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.80)

#Plot 4

plot(power_data1$Time, power_data1$Global_reactive_power, type="l", 
     xlab="datetime", ylab= "Global_reactive_power", col= "black")

#Save file to a png
dev.copy(png, width = 480, height = 480, units = "px", file= "plot4.png")
dev.off()

