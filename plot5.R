library(dplyr)

newNEI<-filter(NEI,fips=="24510")

vectorSCC<-grep("[Vv]ehicle",SCC$Short.Name)

newSCC<-SCC[vectorSCC,]

newerNEI<-newNEI[newNEI$SCC %in% newSCC$SCC,]

newerNEI<-group_by(newerNEI,year)

finalNEI<-summarise(newerNEI,Totals = sum(Emissions))