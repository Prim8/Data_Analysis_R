#load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint,
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
Baltimore <- subset(NEI, NEI$fips == "24510")
point <- subset(Baltimore, Baltimore$type == "POINT")
nonpoint <- subset(Baltimore, Baltimore$type == "NONPOINT")
onroad <- subset(Baltimore, Baltimore$type == "ON-ROAD")
nonroad <- subset(Baltimore, Baltimore$type == "NON-ROAD")

total.point <- as.data.frame.table(tapply(point$Emissions, point$year, sum))
total.point$type <- "POINT"

total.nonpoint <- as.data.frame.table(tapply(nonpoint$Emissions, nonpoint$year, sum))
total.nonpoint$type <- "NONPOINT"

total.onroad <- as.data.frame.table(tapply(onroad$Emissions, onroad$year, sum))
total.onroad$type <- "ON-ROAD"

total.nonroad <- as.data.frame.table(tapply(nonroad$Emissions, nonroad$year, sum))
total.nonroad$type <- "NON-ROAD"

Baltimore.type <- rbind(total.point, total.nonpoint, total.onroad, total.nonroad)

library(ggplot2)
ggplot(Baltimore.type, aes(Var1, Freq)) +
    geom_line(aes(group=1)) + 
    facet_wrap(~ type, nrow=2, ncol=2) +
    labs(x = "Year") +
    labs(y = "Total emissions") +
    labs(title = "Total PM2.5 emission in Baltimore City, Maryland\n from 1999 to 2008, by type of source")

dev.copy(png, file = "plot3.png")
dev.off()
