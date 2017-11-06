NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot4.png")
coalRelatedSCC <- SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]
with(subset(NEI, SCC %in% coalRelatedSCC$SCC), barplot(tapply(Emissions, year, sum)))
title(main="PM2.5 for Coal Combustion-Related Sources", xlab="Year", ylab="Emissions")
dev.off()