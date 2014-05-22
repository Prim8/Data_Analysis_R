#load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Question 1
# Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of the years 
# 1999, 2002, 2005, and 2008.

#n$year <- as.factor(n$year)
total <- as.data.frame.table(tapply(NEI$Emissions, NEI$year, sum))

barplot(total$Freq, xlab = "Year", ylab = "Total emissions", 
        main = "Total PM2.5 emission in the United States\n from 1999 to 2008",
        names.arg=c("1999","2002","2005","2008"))

dev.copy(png, file = "plot1.png")
dev.off()
