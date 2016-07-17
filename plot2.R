setwd("~/Coursera/Exploratory Data Analysis/Week1")
data0<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#extract only the rows that we need, i.e. rows on 1/2/2007 and 2/2/2007
data<-data0[data0$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Character Date and Time into Calendar dates and times
DateTime<-strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Set Global active power into numeric
GlobalActivePower<-as.numeric(data$Global_active_power)

#Save the plot (Line XY Plot) into PNG file.
png("plot2.png",width=480,height=480)
#Create the Line XY Plot of Global Active Power and Date,Time
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)")
#Close the PNG file
dev.off()         