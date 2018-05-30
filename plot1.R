#Read the global dataset
hsdt <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings = "?")

#subset date 
hs<-subset(hsdt,Date=="1/2/2007"|Date=="2/2/2007")

#Open graphic device png
png(file = "plot1.png",width=480,height=480,bg="transparent")

#create the plot
with(hs,hist(Global_active_power,xlab="Global Active Power(Kilowatts)"
             ,col="red",main="Global Active Power"))

#close device
dev.off()
