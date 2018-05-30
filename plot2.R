#Read the global dataset
hsdt <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, header=T, sep=";",na.strings = "?")

#subset date 
hs<-subset(hsdt,Date=="1/2/2007"|Date=="2/2/2007")

#set the complete date and time
Day<-strptime(paste(hs$Date, hs$Time), format="%d/%m/%Y %H:%M:%S")
#get the new dataset with oly time and Global active power
hsd<-cbind(select(hs,"Global_active_power"),Day)

# setting the day name english
Sys.setlocale("LC_TIME", "English")

#Open graphic device png
png(file = "plot2.png",width=480,height=480,bg="transparent")
#get the graphic
plot(hsd$Global_active_power~hsd$Day,type="l",ylab="Global Active Power(Kilowatts)"
     ,xlab="")

#close device
dev.off()

#for information library that i used
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

