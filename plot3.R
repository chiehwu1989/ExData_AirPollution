library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

png("plot3.png")
baltimoreEmissions <- aggregate(Emissions ~ year + type, subset(NEI, fips=="24510"), sum)
ggplot(baltimoreEmissions, aes(x = year, y = Emissions)) +
  geom_bar(stat="Identity") +
  facet_grid(. ~ type) +
  ggtitle("PM2.5 in Baltimore") +
  scale_x_discrete(limit=seq(1999,2008,3))
dev.off()