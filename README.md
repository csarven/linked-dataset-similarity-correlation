# LSD Similarity and Correlation

This repository will investigate Semantic Similarities and Correlations of Linked Statistical Datasets (LSD). The long running hypothesis is to see whether the datasets that are semantically similar have a significant relationship their own correlations.


## Documentation
Coming soon to a theatre near you.


## Workflow

1. Get dataset metadata (e.g., /scripts/worldbank/get.worldbank.metadata.2013.sh)
2. Get each dataset (e.g., /scripts/worldbank/get.worldbank.observation.2013.sh)
3. Create correlations and other analysis for each dataset pair combination (e.g., /scripts/worldbank/create.worldbank.correlation.2013.R)
4. Create dataset metadata subset for semantic similarity (e.g., /scripts/worldbank/create.worldbank.metadata.2013.subset.R)
5. Create semantic similarity for each dataset pair combination
6. Create correlation and other analysis for worldbank.similarity-correlation.R (e.g., /script/worldbank/create.worldbank.similarity-correlation.2013.R

7. Sip coffee and see if the plot makes any sense.


## Requirements

* Bash
* R (ggplot2)
* SPARQL Endpoint (to pull data from)
* SemanticCorrelation (to create a similarity matrix)

