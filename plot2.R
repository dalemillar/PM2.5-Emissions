library(dplyr)

maryland<-filter(NEI,fips == "24510")
by_year<-group_by(maryland,year)
emissions<-summarise(by_year,totals=sum(Emissions))
plot(emissions,type='l',xlab="Year",ylab='Total Emissions (PM2.5 in tons)',
     main="Tri-Annual Baltimore PM2.5 Emissions")
dev.copy(png,file="plot2.png")
dev.off()
