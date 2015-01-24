#readin NEI rdf file
NEI <- readRDS("summarySCC_PM25.rds");

#get sum by year
sum<- tapply(NEI$Emission, NEI$year, FUN=sum)

#plot histgram of emmision total amount each year
barplot(sum,
        xlab="year",
        ylab="total PM2.5 emission")

#copy to an png file
dev.copy(png, file = "plot1.png",width=480,height=480);
dev.off();