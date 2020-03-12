# Shape as a Measure of Weapon Standardisation: A Replication

<!-- badges: start -->
[![R build status](https://github.com/rcctodd/-Christopherson-Garcia-Todd-Winegarden-replication-project/workflows/R-CMD-check/badge.svg)](https://github.com/rcctodd/-Christopherson-Garcia-Todd-Winegarden-replication-project/actions)
<!-- badges: end -->
 
## Contributors

[__Corey Christopherson__](https://github.com/chrico7 "Corey Christopherson on Github") ([![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0001-6470-1146)), [__Thomas Winegarden__](https://github.com/ThomasWinegarden "Thomas Winegarden on Github")  ([![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0003-1912-1964)), [__Richard Todd__](https://github.com/rcctodd "Richard Todd on Github")  ([![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0003-2083-9631)), [__Zack Garcia__](https://github.com/zacharyfgarcia "Zack Garcia on Github")  ([![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-6538-5592))


## Contents

The purpose of this repo is to provide a complete workflow record of our attempt to replicate Figure 8 in the paper _Shape as a measure of weapon standardisation: From metric to geometric morphometric analysis of the Iron Age ‘Havor’ lance from Southern Scandinavia_ by Birch and Martinon-Torres. This figure shows the pair-wise correlation of all lance dimensions across the three underlying datasets next to bivariate plots and distributions of each single dimension with kernel density approximation. We attempt to verify whether these calculations and smoothed distributions look similar upon replication, and also are interested how close we can get to the correct style without any of the actual original figure code.

This project is an assignment for the class DATA 598 'Reproducibility for Data Science', taken as part of the UW Master of Data Science program.

## Citation of Original Study

Birch, T., & Martinon-Torres, M. (2018). Shape as a measure of weapon standardisation: From 
    metric to geometric morphometric analysis of the Iron Age ‘Havor’ lance from Southern
    Scandinavia. Journal of Archaeological Science, 101, 34-51. doi: 
    https://doi.org/10.1016/j.jas.2018.11.002


## Data (Extended) Datasets

Data for this study was obtained from the ScienceDirect online version of this article (https://doi.org/10.1016/j.jas.2018.11.002)

Included Files:
- mmc2.csv: Contains dimensionality information about 123 different lances. These are the following fields: 

	site: Where the lance was found. This can be Ejsbol, Nydam, or Illerup. 
	ID: Unique ID for each lance
	point: Boolean, whether it has a point
	socket: Boolean, whether it has a socket 
	total_length: Total lance length in cm
	blade_length: Blade's length in cm
	socket_length: Just the socket of the lance's length in cm
	sock_bdiam: Maximum socket diameter in cm
	sock_sdiam: Minimum socket diameter in cm
	width: Blade width in cm
	thickness: Blade thickness in cm
	rdist: Distance between rivets in cm
	
- mmc3.csv: Contains normalized coordinates for the seven main "landmark" points defining the shape of 78 different lances,
	site_lance-id: site and ID from mmc2.csv for the lance, concatenated
	x1: x-coordinate of point 1
	y1: y-coordinate of point 1
	...
	x7: x-coordinate of point 7
	y7: y-coordinate of point 7

- yjasc_4911_Appendix_A.R: Source R script for analysis and figure generation done in the paper. 

## Dependencies

- Session info --------------------------------------------------------------------------------
 setting  value                       
 version  R version 3.6.2 (2019-12-12)
 os       Windows >= 8 x64            
 system   x86_64, mingw32             
 ui       RStudio                     
 language (EN)                        
 collate  English_United States.1252  
 ctype    English_United States.1252  
 tz       America/Los_Angeles         
 date     2020-02-23                  

- Packages ------------------------------------------------------------------------------------
 package          * version  date       lib source        
 ape              * 5.3      2019-03-17 [1] CRAN (R 3.6.2)
 assertthat         0.2.1    2019-03-21 [1] CRAN (R 3.6.2)
 backports          1.1.5    2019-10-02 [1] CRAN (R 3.6.1)
 callr              3.4.0    2019-12-09 [1] CRAN (R 3.6.2)
 cli                2.0.1    2020-01-08 [1] CRAN (R 3.6.2)
 coda               0.19-3   2019-07-05 [1] CRAN (R 3.6.2)
 colorspace         1.4-1    2019-03-18 [1] CRAN (R 3.6.1)
 crayon             1.3.4    2017-09-16 [1] CRAN (R 3.6.2)
 crosstalk          1.0.0    2016-12-21 [1] CRAN (R 3.6.2)
 desc               1.2.0    2018-05-01 [1] CRAN (R 3.6.2)
 deSolve            1.27.1   2020-01-02 [1] CRAN (R 3.6.2)
 devtools         * 2.2.1    2019-09-24 [1] CRAN (R 3.6.2)
 digest             0.6.23   2019-11-23 [1] CRAN (R 3.6.2)
 dplyr              0.8.3    2019-07-04 [1] CRAN (R 3.6.2)
 ellipsis           0.3.0    2019-09-20 [1] CRAN (R 3.6.2)
 fansi              0.4.1    2020-01-08 [1] CRAN (R 3.6.2)
 farver             2.0.1    2019-11-13 [1] CRAN (R 3.6.2)
 fastmap            1.0.1    2019-10-08 [1] CRAN (R 3.6.2)
 fs                 1.3.1    2019-05-06 [1] CRAN (R 3.6.2)
 geiger             2.0.6.4  2020-01-25 [1] CRAN (R 3.6.2)
 geomorph         * 3.0.6    2018-04-29 [1] CRAN (R 3.6.2)
 GGally           * 1.4.0    2018-05-17 [1] CRAN (R 3.6.2)
 ggplot2          * 3.2.1    2019-08-10 [1] CRAN (R 3.6.2)
 glue               1.3.1    2019-03-12 [1] CRAN (R 3.6.2)
 gtable             0.3.0    2019-03-25 [1] CRAN (R 3.6.2)
 here             * 0.1      2017-05-28 [1] CRAN (R 3.6.2)
 hms                0.5.3    2020-01-08 [1] CRAN (R 3.6.2)
 htmltools          0.4.0    2019-10-04 [1] CRAN (R 3.6.2)
 htmlwidgets        1.5.1    2019-10-08 [1] CRAN (R 3.6.2)
 httpuv             1.5.2    2019-09-11 [1] CRAN (R 3.6.2)
 jpeg               0.1-8.1  2019-10-24 [1] CRAN (R 3.6.1)
 jsonlite           1.6.1    2020-02-02 [1] CRAN (R 3.6.2)
 knitr              1.26     2019-11-12 [1] CRAN (R 3.6.2)
 labeling           0.3      2014-08-23 [1] CRAN (R 3.6.0)
 later              1.0.0    2019-10-04 [1] CRAN (R 3.6.2)
 lattice            0.20-38  2018-11-04 [2] CRAN (R 3.6.2)
 lazyeval           0.2.2    2019-03-15 [1] CRAN (R 3.6.2)
 lifecycle          0.1.0    2019-08-01 [1] CRAN (R 3.6.2)
 magrittr           1.5      2014-11-22 [1] CRAN (R 3.6.2)
 manipulateWidget   0.10.0   2018-06-11 [1] CRAN (R 3.6.2)
 MASS               7.3-51.4 2019-03-31 [2] CRAN (R 3.6.2)
 Matrix             1.2-18   2019-11-27 [2] CRAN (R 3.6.2)
 memoise            1.1.0    2017-04-21 [1] CRAN (R 3.6.2)
 mime               0.9      2020-02-04 [1] CRAN (R 3.6.2)
 miniUI             0.1.1.1  2018-05-18 [1] CRAN (R 3.6.2)
 munsell            0.5.0    2018-06-12 [1] CRAN (R 3.6.2)
 mvtnorm            1.0-12   2020-01-09 [1] CRAN (R 3.6.2)
 nlme               3.1-142  2019-11-07 [2] CRAN (R 3.6.2)
 pillar             1.4.3    2019-12-20 [1] CRAN (R 3.6.2)
 pkgbuild           1.0.6    2019-10-09 [1] CRAN (R 3.6.2)
 pkgconfig          2.0.3    2019-09-22 [1] CRAN (R 3.6.2)
 pkgload            1.0.2    2018-10-29 [1] CRAN (R 3.6.2)
 plyr               1.8.5    2019-12-10 [1] CRAN (R 3.6.2)
 prettyunits        1.1.0    2020-01-09 [1] CRAN (R 3.6.2)
 processx           3.4.1    2019-07-18 [1] CRAN (R 3.6.2)
 progress           1.2.2    2019-05-16 [1] CRAN (R 3.6.2)
 promises           1.1.0    2019-10-04 [1] CRAN (R 3.6.2)
 ps                 1.3.0    2018-12-21 [1] CRAN (R 3.6.2)
 purrr              0.3.3    2019-10-18 [1] CRAN (R 3.6.2)
 R6                 2.4.1    2019-11-12 [1] CRAN (R 3.6.2)
 RColorBrewer       1.1-2    2014-12-07 [1] CRAN (R 3.6.0)
 Rcpp               1.0.3    2019-11-08 [1] CRAN (R 3.6.2)
 remotes            2.1.0    2019-06-24 [1] CRAN (R 3.6.2)
 reshape            0.8.8    2018-10-23 [1] CRAN (R 3.6.2)
 reshape2           1.4.3    2017-12-11 [1] CRAN (R 3.6.2)
 rgl              * 0.100.30 2019-08-19 [1] CRAN (R 3.6.2)
 rlang              0.4.4    2020-01-28 [1] CRAN (R 3.6.2)
 rprojroot          1.3-2    2018-01-03 [1] CRAN (R 3.6.2)
 RRPP             * 0.5.2    2020-01-26 [1] CRAN (R 3.6.2)
 rstudioapi         0.10     2019-03-19 [1] CRAN (R 3.6.2)
 scales             1.1.0    2019-11-18 [1] CRAN (R 3.6.2)
 scatterplot3d      0.3-41   2018-03-14 [1] CRAN (R 3.6.2)
 sessioninfo        1.1.1    2018-11-05 [1] CRAN (R 3.6.2)
 shapes           * 1.2.3    2017-11-18 [1] CRAN (R 3.6.2)
 shiny              1.4.0    2019-10-10 [1] CRAN (R 3.6.2)
 stringi            1.4.4    2020-01-09 [1] CRAN (R 3.6.2)
 stringr            1.4.0    2019-02-10 [1] CRAN (R 3.6.2)
 subplex            1.5-4    2018-04-05 [1] CRAN (R 3.6.2)
 testthat           2.3.1    2019-12-01 [1] CRAN (R 3.6.2)
 tibble             2.1.3    2019-06-06 [1] CRAN (R 3.6.2)
 tidyselect         0.2.5    2018-10-11 [1] CRAN (R 3.6.2)
 usethis          * 1.5.1    2019-07-04 [1] CRAN (R 3.6.2)
 utf8               1.1.4    2018-05-24 [1] CRAN (R 3.6.2)
 vctrs              0.2.1    2019-12-17 [1] CRAN (R 3.6.2)
 viridisLite        0.3.0    2018-02-01 [1] CRAN (R 3.6.2)
 webshot            0.5.2    2019-11-22 [1] CRAN (R 3.6.2)
 withr              2.1.2    2018-03-15 [1] CRAN (R 3.6.2)
 xfun               0.12     2020-01-13 [1] CRAN (R 3.6.2)
 xtable             1.8-4    2019-04-21 [1] CRAN (R 3.6.2)
 yaml               2.2.1    2020-02-01 [1] CRAN (R 3.6.2)
 zeallot            0.1.0    2018-01-28 [1] CRAN (R 3.6.2)
 

## Contributing
 
We welcome contributions from everyone. Before you get started, please see our [contributor guidelines](https://github.com/rcctodd/598A_replication_project/blob/master/CONTRIBUTING.md). Please note that this project is released with a [Contributor Code of Conduct](https://github.com/rcctodd/598A_replication_project/blob/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
