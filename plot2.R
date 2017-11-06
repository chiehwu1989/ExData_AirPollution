NEI <- readRDS("summarySCC_PM25.rds")

png("plot2.png")
with(subset(NEI, fips=="24510"), barplot(tapply(Emissions, year, sum)))
title(main="PM2.5 in Batimore", xlab="Year", ylab="Emissions")
dev.off()