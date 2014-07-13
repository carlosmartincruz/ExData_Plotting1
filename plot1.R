function<-plot1()
  {
  data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
  subdata<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  GAP1<-subdata$Global_active_power
  GAP2<-as.numeric(GAP1)
  png(file="plot1.png",width=480,height=480)
  hist(GAP2,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  dev.off()
  }
