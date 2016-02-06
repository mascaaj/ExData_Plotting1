#Assignment_1 - Exploratory Data Analysis - PLOT-01
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
png(filename="plot1.png",width=480,height=480,units="px")
#PLOT HISTOGRAM WITH REQUIRED VARIABLES AND PLOT FEATURES
hist(Data_2$Global_active_power, col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
#CLOSE GRAPHICS DEVICE