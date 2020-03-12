FROM rocker/binder:3.6.0
LABEL maintainer='Richard Todd'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}



RUN wget https://github.com/rcctodd/-Christopherson-Garcia-Todd-Winegarden-replication-project/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2020-03-12/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
