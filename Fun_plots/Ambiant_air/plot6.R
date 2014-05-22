#load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?
Baltimore <- subset(NEI, NEI$fips == "24510")
onroad <- subset(Baltimore, Baltimore$type == "ON-ROAD")
Baltimore.emissions <- as.data.frame.table(tapply(onroad$Emissions, onroad$year, sum))
Baltimore.emissions$percent.change <- as.vector(Delt(Baltimore.emissions$Freq)*100)
Baltimore.emissions$location <- "Baltimore City"
Baltimore.emissions <- Baltimore.emissions[2:4, ]

LA <- subset(NEI, NEI$fips == "06037")
LA.onroad <- subset(LA, LA$type == "ON-ROAD")
LA.emissions <- as.data.frame.table(tapply(LA.onroad$Emissions, LA.onroad$year, sum))
LA.emissions$percent.change <- as.vector(Delt(LA.emissions$Freq)*100)
LA.emissions$location <- "Los Angeles County"
LA.emissions <- LA.emissions[2:4, ]

LA.Baltimore <- rbind(Baltimore.emissions, LA.emissions)
colnames(LA.Baltimore) <- c("year", "total.emissions", "percent.change", "location")

library(ggplot2)
qplot(year, percent.change, fill=location,
      data=LA.Baltimore, geom="bar", stat="identity",
      position="dodge") +
    scale_x_discrete(labels=c("1999-2002", "2002-2005", "2005-2008")) + 
    labs(x = "Year") +
    labs(y = "Percent change (%)") +
    labs(title = "Percent change in emissions from motor vehicle sources\n in Baltimore City and Los Angeles County\n from 1999 to 2008")

dev.copy(png, file = "plot6.png")
dev.off()
                                                                                                                                                                                 