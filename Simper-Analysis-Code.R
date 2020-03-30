# For simper analysis, we followed the instructions here:https://rstudio-pubs-static.s3.amazonaws.com/343284_cbadd2f3b7cd42f3aced2d3f42dc6d33.html#otus_that_differ_by

# Code for the simper analysis is available here:
source("Steinberger_scripts/simper_pretty.r")

# this is the code that we actually ran
simper.pretty(OTUtable, metadata, c('CC'), perc_cutoff=1, low_cutoff = 'y', low_val=0.01, 'CC-OTUs')

simper.results = data.frame(read.csv("CC-OTUs_clean_simper.csv"))
