#Rather than spend hours worrying about ambiguity in the question, I have
#grabbed the bull by the horns and simply looked for Coal and coal in the
#SCC data frame Short.Name variable using grep and 
#created a vector called 'these' with the SCC record
#numbers.  Then I create a new smaller df called newSCC based on these index.
#Finally create df newNEI checking NEI$SCC numbers that are in newSCC$SCC

these<-grep("[Cc]oal",SCC$Short.Name)
newSCC<-SCC[these,]
newNEI<-NEI[NEI$SCC %in% newSCC$SCC,]

library(dplyr)

newerNEI<-group_by(newNEI,year)
newerNEI<-summarise(newerNEI,Totals=sum(Emissions))

plot(newerNEI,type='l',xlab="Year",ylab='Total Emissions (PM2.5 in tons)',
     main="Tri-Annual National PM2.5 Emissions Relating to Coal Combustion")

dev.copy(png,file="plot4.png")
dev.off()