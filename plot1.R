setwd("~/Coursera/Exploratory/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

by_year<-group_by(NEI,year)
emissions<-summarise(by_year,totals = sum(Emissions))

plot(emissions,type='l',xlab="Year",ylab='Total Emissions (PM2.5 in tons)',
     main="Tri-Annual National PM2.5 Emissions")

dev.copy(png,file="plot1.png")
dev.off()

