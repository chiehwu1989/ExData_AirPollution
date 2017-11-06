library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot6.png")
vehicleRelatedSCC <- SCC[grepl(".*vehicle.*", ignore.case = TRUE, SCC$EI.Sector),]
filteredNEI <- subset(NEI, (fips=="24510" | fips=="06037") & SCC %in% vehicleRelatedSCC$SCC)
countyName <- c(
  `24510` = "Baltimore City",
  `06037` = "Los Angeles County"
)
ggplot(filteredNEI, aes(x = year, y = Emissions)) + geom_bar(stat="Identity") +
  facet_grid(. ~ fips, labeller = as_labeller(countyName)) +
  ggtitle("PM2.5 for Motor Vehicle Related Sources in Baltimore vs LA") +
  scale_x_discrete(limit=seq(1999,2008,3))
dev.off()
