## This code takes its origin from plot1.R and is used to answer question 4
## How have emissions from coal combustion-related sources changed, from 1999 to 2008, around the United States?

## Use of the ggplot2 plotting system is continued here
## After reading, merge the 2 datasets

NEISCC <- merge(NEI, SCC, by ="SCC")

## load required package
library(ggplot2)

## select all NEISCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
## subset coal
NEISCCsub <- NEISCC[coalMatches, ]
aggTotals <- aggregate(Emissions ~ year,NEISCCsub, sum)

## plot 4
g <- ggplot(aggTotals, aes(factor(year), Emissions, color = Year))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008 in Kilotons')
dev.copy(png, file="plot3.png", height=640, width=480)
print (g)
dev.off()
