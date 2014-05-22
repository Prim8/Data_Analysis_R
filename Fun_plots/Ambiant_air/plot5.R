#load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Question 5
# How have emissions from motor vehicle sources changed from 1999–2008
# in Baltimore City?
# Note: an inspection of the data source documentation (http://www.epa.gov/ttn/chief/net/2008neiv3/2008_neiv3_tsd_draft.pdf)
# indicates that of the four types of sources inticated by the "type"
# column, vehicles are classified under the "on-road" type. Therefore, 
# I will use a subset of "on-road" type for Baltimore to answer to this
# question.
Baltimore <- subset(NEI, NEI$fips == "24510")
onroad <- subset(Baltimore, Baltimore$type == "ON-ROAD")
total.onroad <- as.data.frame.table(tapply(onroad$Emissions, onroad$year, sum))

barplot(total.onroad$Freq, xlab = "Year", ylab = "Total emissions", 
        main = "Total emission from motor vehicle sources\n in Baltimore City, Maryland\n from 1999 to 2008",
        names.arg=c("1999","2002","2005","2008"))

dev.copy(png, file = "plot5.png")
dev.off()
