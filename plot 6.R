## Answering question 6
## Comparing emissions from motor vehicle sources in Baltimore City with those from Los Angeles County
## California (fips == "06037")
## Which city has seen greater changes over time in motor vehicle emissions?

## load required package: ggplot2
library(ggplot2)
## merge the 2 datasets
NEISCC <- merge(NEI, SCC, by ="SCC")

## County in Baltimore City is "24510", whereas Los Angeles County is "06037"
## Search for on-road type in NEI
NEIsub3 <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]
aggTotalByYearAndFips <- aggregate(Emissions ~ year + fips, NEIsub3, sum)
aggTotalByYearAndFips$fips[aggTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggTotalByYearAndFips$fips[aggTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
g <- ggplot(aggTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips, margins = TRUE)
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions in tons")) + ggtitle('Variations in Total Emissions (in tons) from motor vehicles: Baltimore City, MD vs Los Angeles, CA 1999-2008')
print(g)
dev.copy(png, file="plot6.png", height=1040, width=640)
dev.off()
