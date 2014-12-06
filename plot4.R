df <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

df$newdate <- paste(df$Date,df$Time)

df$newdate <- strptime(df$newdate,"%d/%m/%Y %H:%M:%S")

x <- df$newdate

#global active power
gap <- df[[3]]

#voltage
vol <- df[[5]]

#global reactive power
grp <- df[[4]]

#sub metering one
sm1 <- df[[7]]

#sub metering two
sm2 <- df[[8]]

#sub metering three
sm3 <- df[[9]]

png(file="plot4.png",width=960,height=960)

par(mfcol=c(2,2))

#global active power graph
plot(x,gap,type="l",ylab="Global Active Power (kilowatts)",xlab="", main="")
#energy sub metering graph
plot(x,sm1,type="n",ylab="Energy sub metering",xlab="", main="")
lines(x,sm1,col="black")
lines(x,sm2,col="red")
lines(x,sm3,col="blue")

legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

#voltage graph
plot(x,vol,type="l",ylab="Voltage",xlab="datetime", main="")

#global reactive power graph
plot(x,grp,type="l",ylab="Global_reactive_power",xlab="datetime", main="")




dev.off()
