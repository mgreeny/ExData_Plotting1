df <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

df$DateTime <- paste(df$Date,df$Time)

df[1] <- strptime(df$Date,"%d/%m/%Y %H:%M:%S")

x <- df[[10]]

y <- df[[3]]

png(file="plot3.png",width=480,height=480)

plot(x,y,type="l",ylab="Global Active Power (kilowatts)", main="")

dev.off()

