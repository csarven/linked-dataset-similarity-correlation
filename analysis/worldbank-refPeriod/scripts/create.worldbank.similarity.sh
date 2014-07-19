#!/bin/bash
#Author: Sarven Capadisli <info@csarven.ca>
#Author URL: http://csarven.ca/#i

. ./config.sh

../../../../SemanticCorrelation/./semanticCorrelation.py --iters 2000 --topics 200 --infile "${metaPath}"worldbank.metadata."${refPeriod}".subset.csv --outfile "${summaryPath}"similarity."${refPeriod}".csv
