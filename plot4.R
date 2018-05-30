#Read the global dataset
hsdt <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, header=T, sep=";",na.strings = "?")

#subset date 
hs<-subset(hsdt,Date=="1/2/2007"|Date=="2/2/2007")

#set the complete date and time
Day<-strptime(paste(hs$Date, hs$Time), format="%d/%m/%Y %H:%M:%S")
#get the new dataset with oly time and Global active power
hsd<-cbind(hs,Day)

# setting the day name english
Sys.setlocale("LC_TIME", "English")


#Open graphic device png
png(file = "plot4.png",width=480,height=480,bg="transparent")

#initialise the four graphics
par(mfrow=c(2,2))

#1
plot(hsd$Global_active_power~hsd$Day,type="l",ylab="Global Active Power"
     ,xlab="")
#2
plot(hsd$Voltage~hsd$Day,type="l",ylab="Voltage"
     ,xlab="DateTime")
#3
plot(hsd$Sub_metering_1~hsd$Day,type="l",ylab="Energy sub metering"
     ,xlab="")
lines(hsd$Sub_metering_2~hsd$Day,col="red")
lines(hsd$Sub_metering_3~hsd$Day,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
       col=c("black","red","blue"),bty = "n")
#4
plot(hsd$Global_reactive_power~hsd$Day,type="l",ylab="Global_reactive_power"
     ,xlab="DateTime")

#close device
dev.off()

#for information library that i used
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

