This code is a continuation of analysis from plot1.R, and is written to
## Answer question 2:

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008?
## The base plotting system is used below to answer this question

## Subset Baltimore City
NEIsub  <- NEI[NEI$fips=="24510", ]
aggTotals <- aggregate(Emissions ~ year,NEIsub, sum)

## Plot 2
barplot(height = aggTotals$Emissions, names.arg = aggTotals$year, xlab = "Years", ylab = expression('Total PM'[2.5]*'emission'), main = expression('Total PM'[2.5]*'Emissions in the Baltimore City, MD at various years, in Kilotons'))
dev.copy(png, file="plot2.png", height=640, width=480)
dev.off()
