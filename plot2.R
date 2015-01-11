#R script to generate line plot of household power consumption
# new colum TimeStamp of type DateTime created 

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile="./data/getdatadata_FEDSTATS_Country.csv",method="curl")
#read in col headings only for later use
names <- read.csv("./data/household_power_consumption.txt",header=TRUE,nrows=1,sep=";",na.strings = "?")
# Only interested in 2 days of data, 2007-02-01 and 2007-02-02, so skip first 66638 lines and only load nrows 2879 = 69517 - 66638
data1 <- read.table("./data/household_power_consumption.txt",header=FALSE,skip=66637,nrows=2879,sep=";",na.strings = "?")
colnames(data1) <- colnames(names)

data1$TimeStamp <- strptime(paste(data1$Date,data1$Time),"%d/%m/%Y%H:%M:%S")

plot(data1$TimeStamp,data1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#produce png file
dev.copy(png,"plot2.png",width=480, height=480)
dev.off() # close png plot file device