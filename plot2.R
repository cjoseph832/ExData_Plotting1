rm(list=ls())
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data[,1]<-dmy(data[,1])
data[,2]<-hms(data[,2])
date1<-dmy("01-02-2007")
date2<-dmy("02-02-2007")
data1<-data[data[,1]==date1 | data[,1]==date2,]
DateTime<-data1[,1]+data1[,2]
data2<-cbind(DateTime,data1)
Power<-as.numeric(as.character(data2[,4]))
plot(DateTime,Power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()