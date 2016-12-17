## This code takes its origin from plot1.R and is used to answer question 3 
## The code makes use of ggplot2 plotting system

## load required package: ggplot2

library(ggplot2)

## Baltimore City is a subset of NEI (refer to plot 2.R) made up of 24510 for the period 1999 to 2008

aggTotalsType <- aggregate(Emissions ~ year + type,NEIsub, sum)

## Plot 3
g <- ggplot(aggTotalsType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
dev.copy(png, file="plot3.png", height=640, width=480)
print (g)
dev.off()
