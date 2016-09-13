#As per Q5, I grepped on a simple term in the SCC - in this case 
#"[Vv]ehicle" in Short.Name
#Having filtered NEI on fips==24510 or 06037, then use SCC vector to pick out v ehicle emissions


library(dplyr)

newNEI<-filter(NEI,fips=="24510" | fips=='06037')

vectorSCC<-grep("[Vv]ehicle",SCC$Short.Name)

newSCC<-SCC[vectorSCC,]

newerNEI<-newNEI[newNEI$SCC %in% newSCC$SCC,]

newerNEI<-group_by(newerNEI,fips,year)

finalNEI<-summarise(newerNEI,Totals = sum(Emissions))

plot(finalNEI,type='l',xlab="Year",ylab='Total Emissions (PM2.5 in tons)',
     main="Baltimore PM2.5 Emissions wrt Motor Vehicles")

dev.copy(png,file="plot5.png")
dev.off()