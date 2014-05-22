#load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
# system to make a plot answering this question.

Baltimore <- subset(NEI, NEI$fips == "24510")
total.Baltimore <- as.data.frame.table(tapply(Baltimore$Emissions, Baltimore$year, sum))

barplot(total.Baltimore$Freq, xlab = "Year", ylab = "Total emissions", 
        main = "Total PM2.5 emission in Baltimore City, Maryland\n from 1999 to 2008",
        names.arg=c("1999","2002","2005","2008"))

dev.copy(png, file = "plot2.png")
dev.off()
