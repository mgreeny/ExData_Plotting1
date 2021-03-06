df <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

Sys.setlocale('LC_TIME', 'C')

df$newdate <- paste(df$Date,df$Time)

df$newdate <- strptime(df$newdate,"%d/%m/%Y %H:%M:%S")

x <- df$newdate

y <- df[[3]]

png(file="plot2.png",width=480,height=480)

plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="", main="")

dev.off()
