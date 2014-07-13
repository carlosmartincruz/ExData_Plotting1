  data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
  subdata<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  p<-paste(subdata$Date,subdata$Time)
  p2<-data.frame(p)
  p3<-sapply(p2,function(x)strptime(x,'%d/%m/%Y %H:%M:%S'))
  x<-data.frame(p3)
  y<-subdata[,7:9]
  relevant<-data.frame(x,y)
  png(file="plot3.png",width=480,height=480)
  plot(c(relevant$p,relevant$p,relevant$p ),c(as.numeric(relevant$Sub_metering_1), as.numeric(relevant$Sub_metering_2),as.numeric(relevant$Sub_metering_3)),pch=26,xlab=" ",ylab="Energy sub metering")
  lines(relevant$p,as.numeric(relevant$Sub_metering_1))
  lines(relevant$p,as.numeric(relevant$Sub_metering_2),col="red")
  lines(relevant$p,as.numeric(relevant$Sub_metering_3),col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  dev.off()



