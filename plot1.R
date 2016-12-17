## Answering question 1
This code is written to answer the question below

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## The base plotting system will be used to create a plot showing the total PM2.5 emission from all sources from 1999 to 2008

## Acquire data
dataset_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
unzip("Dataset.zip", exdir = "Dataset")
setwd("C:/Users/Abdulrahman/Documents/Coursera/Exploratory Data Analysis/Dataset2")
files <- list.files("summarySCC_PM25.rds", recursive = TRUE)
## Each of the 2 files are read with readRDS()

## The first line will likely take a few seconds to complete. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

## Plot 1

barplot(height = aggTotals$Emissions, names.arg = aggTotals$year, xlab = "Years", ylab = expression('Total PM'[2.5]* 'emission'), main = expression('Total PM'[2.5]*'Emissions at various years, in Kilotons'))

##Saving plot to file

dev.copy(png, file="plot1.png", height=640, width=480)
dev.off()
