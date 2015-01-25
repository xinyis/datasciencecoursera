library(plyr);
library(ggplot2);

#readin NEI rdf file
NEI <- readRDS("summarySCC_PM25.rds");

#get sum by year and type using ddply function
baltimoreData <- NEI[NEI$fips==24510,];
plotData <- ddply(baltimoreData, c("type", "year"), summarise,sumOfEmissions=sum(Emissions));

#plot emmision total amount each year grouped by type
qplot(year,sumOfEmissions,data=plotData)+facet_grid(~type)+geom_smooth(method = "lm");

#copy to an png file
dev.copy(png, file = "plot3.png",width=480,height=480);
dev.off();