#Assignment_1 - Exploratory Data Analysis - PLOT-04
#AJM 06FEB16 V2.1
#NOTE, USER MUST SET THEIR OWN WORKING DIRECTORY

#CLEAR THE WORKSPACE, SET PATH, LOAD DATA SPECIFYING THE SEPARATOR, AND MISSING VALUES
rm(list=ls())
##############################
#INSERT WORKING DIRECTORY HERE
setwd("C://Documents//Coursera//CS_4_EDA_ST//exdata-data-household_power_consumption")
##############################
Data_0<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",skipNul = TRUE)

#INITIALIZE LIBRARIES THAT WILL BE USEFUL IN THE ANALYSIS
library(dplyr)
library(lubridate)

#COPY OVER RAW DATA TO ANOTHER VARIABLE, CONVERT DATE FORMAT TO MORE PLYABLE FORM
Data_1<-Data_0
Data_1$Date<-as.Date(Data_1$Date, "%d/%m/%Y")

#SUBSET DATA, CREATE TIME VECTOR FOR PLOTTING
Data_2<-subset(Data_1,Date=="2007-02-01"|Date=="2007-02-02")
time<-as.POSIXct(paste(Data_2$Date,Data_2$Time,sep=" "))
#DATA CLEANED AND READY TO PLOT.


#INITIALIZE THE GRAPHICS DEVICE, SPECIFY SIZE AS PER ASSIGNMENT REQUIREMENTS
png(filename="plot4.png",width=480,height=480,units="px")
#SPECIFY MARGINS
par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(0,1,0,0))
#PLOT REQUIRED PLOTS WITH FORMATTING IN SEQUENTIAL ORDER AND REQUIRED FEATURES
with(Data_2,{
  plot(time,Data_2$Global_active_power,xlab="",ylab="Global Active Power",type="l")
  plot(time,Data_2$Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(time,Data_2$Sub_metering_1,ylab="Energy Sub Metering",xlab="",type="l")
  lines(time,Data_2$Sub_metering_2,col="red")
  lines(time,Data_2$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(time,Data_2$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
})
dev.off()
#CLOSE GRAPHICS DEVICE
