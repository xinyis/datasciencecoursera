#readin NEI rdf file
NEI <- readRDS("summarySCC_PM25.rds");

#get sum by year
baltimoreData <- NEI[NEI$fips==24510,];
sum<- tapply(baltimoreData$Emission, baltimoreData$year, FUN=sum)

#plot histgram of emmision total amount each year
barplot(sum,
        main="Yearly total PM2.5 emissions of Baltimore City",
        xlab="year",
        ylab="total PM2.5 emission");

#copy to an png file
dev.copy(png, file = "plot2.png",width=480,height=480);
dev.off();