#readin NEI rdf file
NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");

#filter NEI data for coal combustion-related sources 
coalNames <- grep(" [cC]oal ", SCC$Short.Name, value=TRUE);
coalSCCs <- SCC[SCC$Short.Name %in% coalNames,]$SCC;
coalData <- NEI[NEI$SCC %in% coalSCCs,];

#sum by fips and year
plotData <- tapply(coalData$Emission, coalData$year, FUN=sum);

#plot
barplot(plotData,
        main="Coal combustion-related sources total emssions",
        xlab="year",
        ylab="total PM2.5 emission");

#save to png file
dev.copy(png, file = "plot4.png",width=480,height=480);
dev.off();