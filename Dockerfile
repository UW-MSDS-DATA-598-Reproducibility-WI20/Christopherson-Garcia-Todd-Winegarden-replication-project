# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:3.6.2

# required
MAINTAINER Richard Todd <rcctodd@uw.edu>

COPY . /Christopherson-Garcia-Todd-Winegarden-replication-project

# go into the repo directory
RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev mesa-common-dev libcgal-dev libglu1-mesa-dev libglu1-mesa-dev libx11-dev -y \
  # build this compendium package
  && R -e "devtools::install('/Christopherson-Garcia-Todd-Winegarden-replication-project', dep=TRUE)" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main Rmd file
  && R -e "rmarkdown::render('/Christopherson-Garcia-Todd-Winegarden-replication-project/')"
