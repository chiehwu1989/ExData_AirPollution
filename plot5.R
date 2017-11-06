NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot5.png")
vehicleRelatedSCC <- SCC[grepl(".*vehicle.*", ignore.case = TRUE, SCC$EI.Sector),]
baltimoreNEI <- subset(NEI, fips=="24510" & SCC %in% vehicleRelatedSCC$SCC)
with(baltimoreNEI, barplot(tapply(Emissions, year, sum)))
title(main="PM2.5 for Motor Vehicle Related Sources in Baltimore", xlab="Year", ylab="Emissions")
dev.off()