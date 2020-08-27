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

power_data1 <- subset(power_data,power_data$Date=="1/2/2007" | 
                        power_data$Date =="2/2/2007")
power_data1$Global_active_power<- as.numeric(power_data1$Global_active_power)

#Plot command and save to a png file 

hist(power_data1$Global_active_power, col= "red", main= "Global Active Power", 
     xlab= "Global Active Power (kilowatts", ylab= "Frequency")
dev.copy(png, width = 480, height = 480, units = "px", file= "plot1.png")
dev.off()                     
