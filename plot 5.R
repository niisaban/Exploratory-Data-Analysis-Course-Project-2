## This code takes its origin from plot1.R and is used to answer question 5
## How have emissions from motor vehicle sources changed from 1999 to 2008 in Baltimore City?

## After reading file, merge the 2 datasets
NEISCC <- merge(NEI, SCC, by ="SCC")

## In Baltimore City, on-road emissions were found in the county "24510"
## Search for on-road type in NEI
NEIsub2  <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD", ]
aggTotals <- aggregate(Emissions ~ year,NEIsub2, sum)

## plot 5
g <- ggplot(aggTotals, aes(factor(year), Emissions, color = Year))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Change in Total Emissions from 1999 to 2008 from motor vehicles in Baltimore City')
dev.copy(png, file="plot5.png", height=640, width=480)
print(g)
dev.off()
