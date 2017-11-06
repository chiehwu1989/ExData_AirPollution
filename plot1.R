NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png")
with(NEI, barplot(tapply(Emissions, year, sum)))
title(main="PM2.5", xlab="Year", ylab="Emissions")
dev.off()