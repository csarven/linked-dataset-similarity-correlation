PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX qb: <http://purl.org/linked-data/cube#>
PREFIX sdmx-dimension: <http://purl.org/linked-data/sdmx/2009/dimension#>
PREFIX year: <http://reference.data.gov.uk/id/year/>
PREFIX graph: <http://worldbank.270a.info/graph/>

SELECT DISTINCT ?identifier ?title
WHERE {
    GRAPH graph:world-development-indicators {
        ?observation sdmx-dimension:refPeriod year:2013 .
        ?observation qb:dataSet ?dataset .
    }
    GRAPH graph:meta {
        ?dataset dcterms:identifier ?identifier .
        ?dataset dcterms:title ?title .
    }
}
ORDER BY LCASE(?identifier)
