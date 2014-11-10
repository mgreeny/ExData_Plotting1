install.packages("dplyr")

library(dplyr)

df <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

df[1] <- as.Date(df$Date,"%d/%m/%Y")

png(file="plot1.png",width=480,height=480)

hist(df$Global_active_power,freq=TRUE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
