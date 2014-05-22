#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?
# Note: Since SCC$Short.Name lists the general source of emission, I
# choose to select the rows that contain "Coal" in the description of 
# the SCC$Short.Name column
coal <- SCC[grepl("Coal", SCC$Short.Name), ]
merged <- merge(NEI, coal, by.x = "SCC")

total.coal <- as.data.frame.table(tapply(merged$Emissions, merged$year, sum))

barplot(total.coal$Freq, xlab = "Year", ylab = "Total emissions", 
        main = "Total emissions from coal combustion-related\n sources in the US from 1999 to 2008",
        names.arg=c("1999","2002","2005","2008"))

dev.copy(png, file = "plot4.png")
dev.off()
