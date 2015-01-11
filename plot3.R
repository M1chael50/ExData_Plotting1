library(datasets)

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile="./data/getdatadata_FEDSTATS_Country.csv",method="curl")
# skip 66638
# nrows 2879 = 69517 - 66638
#setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
#colClasses=c(myData,character,numeric,numeric,numeric,numeric,numeric,numeric,numeric)
names <- read.csv("./data/household_power_consumption.txt",header=TRUE,nrows=1,sep=";",na.strings = "?")
data1 <- read.table("./data/household_power_consumption.txt",header=FALSE,skip=66637,nrows=2879,sep=";",na.strings = "?")
colnames(data1) <- colnames(names)

data1$Time <- strptime(paste(data1$Date,data1$Time),"%d/%m/%Y%H:%M:%S")

plot(data1$Time,data1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")

points(data1$Time,data1$Sub_metering_2,type="l",col=2)

lines(data1$Time,data1$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,legend=colnames(data1[,c(7,8,9)]),col=c(1,2,"blue"))
dev.copy(png,"plot3.png",width=480, height=480)
dev.off() # close pdf plot file device