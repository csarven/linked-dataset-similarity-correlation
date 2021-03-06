#Author: Sarven Capadisli <info@csarven.ca>
#Author URL: http://csarven.ca/#i

library(ggplot2)

source("config.worldbank.R", local=TRUE)

cat("Get dataset similarities and correlations from each dataset\n")
dataX <- read.csv(paste0(summaryPath, "similarity", ".", refPeriod, ".csv"), na.strings='', header=T)
dataX$similarity <- abs(dataX$similarity)
dataX <- dataX[(dataX$similarity>0.05 & dataX$similarity<0.95),]

dataY <- read.csv(paste0(summaryPath, "correlation", ".", refPeriod, ".csv"), na.strings='', header=T)
dataY$correlation <- abs(dataY$correlation)
dataY <- dataY[(dataY$n > 50 & dataY$pValue < 0.05 & dataY$correlation > 0.05 & dataY$correlation < 0.95),]

data <- merge(dataX, dataY, by=c("datasetX", "datasetY"))

write.csv(data, file=paste0(summaryPath, "similarity-correlation", ".", refPeriod, ".csv"), row.names=FALSE)

cat("Analysis\n")
correlation <- cor(data$similarity, data$correlation, use="complete.obs", method=correlationMethod)
pValue <- cor.test(data$similarity, data$correlation, method=correlationMethod)$p.value
n <- nrow(data)

cat("Create and store plot\n")
g <- ggplot(data, aes(data$similarity, data$correlation)) + xlab("Semantic similarity") + ylab("Correlation") + geom_point(alpha = 1/10) + ggtitle(paste0(refPeriod, " World Bank indicators with all topics")) + theme_bw(base_size = 12, base_family = "")

g <- g + annotate("text", x=Inf, y=Inf, label="270a.info", hjust=1.3, vjust=2, color="#0000E4", size=4)
g <- g + annotate("text", x=Inf, y=0, label=paste0("correlation: ", format(round(correlation, 3))), hjust=1.2, vjust=-4.75, size=4)
g <- g + annotate("text", x=Inf, y=0, label=paste0("p-value: ", format(round(pValue, 3))), hjust=1.25, vjust=-2.75, size=4)
g <- g + annotate("text", x=Inf, y=0, label=paste0("n: ", n), hjust=1.475, vjust=-0.75, size=4)

ggsave(plot=g, file=paste0(plotPath, ".png"), width=7, height=7)

cat(paste("correlation", "pValue", "n", sep=","), file=paste0(summaryPath, "result", ".", refPeriod, ".csv"), sep="\n")
cat(paste(correlation, pValue, n, sep=","), file=paste0(summaryPath, "result", ".", refPeriod, ".csv"), sep="\n", append=TRUE)


#g

#warnings()

