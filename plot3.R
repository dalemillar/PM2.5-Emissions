library(dplyr)
library(ggplot2)

q3<-group_by(NEI,type,year)
emissions<-summarise(q3,totals=sum(Emissions))

qplot(year,totals,data=emissions,geom='line',color=type)

dev.copy(png,file="plot2.png")
dev.off()