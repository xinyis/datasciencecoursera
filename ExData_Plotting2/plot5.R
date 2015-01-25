#readin NEI rdf file
NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");

#filter NEI data for coal combustion-related sources 
motorNames <- grep(" [Vv]ehicle ", SCC$Short.Name, value=TRUE);
motorSCCs <- SCC[SCC$Short.Name %in% coalNames,]$SCC;
motorData <- NEI[which(NEI$SCC %in% motorSCCs & NEI$fips==24510),];

#sum by fips and year
plotData <- tapply(motorData$Emission, motorData$year, FUN=sum);

#plot
barplot(plotData,
        main="Yearly total emssions of motor Vechiles in Baltimore",
        xlab="year",
        ylab="total PM2.5 emission");

#save to png file
dev.copy(png, file = "plot5.png",width=480,height=480);
dev.off();