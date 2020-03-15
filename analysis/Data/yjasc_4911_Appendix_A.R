#______________________________________________________________________
# METRIC AND GEOMETRIC MORPHOMETRIC ANALYSIS OF HAVOR LANCES: R SCRIPT
# By Thomas Edward Birch
# Date: 04-10-2018
#______________________________________________________________________

                          #-#-#-#-#-#-#-#-#-#-#-
                          #### INTRODUCTION ----
                          #-#-#-#-#-#-#-#-#-#-#-

# The purpose of this R script is to make it possible for readers to evaluate
# the data manipulation procedures and statistical analyses that were performed,
# and to easily reproduce the results published.
#
# The aim is to provide a clear and transparent script that is self-explanatory
# through heavy annotation, and thus make it possible for readers to critically
# evaluate the quality of analysis being conducted and reliability of results.
#
# The code provided in this script utilised freely available and open source
# software (FOSS) packages and programmes. As such, the script remains free
# and open for anyone to copy and/or update as necessary for their own projects.
# Accreditation of the original source of any used/updated code would be kindly
# appreciated, so that future readers may always be able to refer to the original
# source for their satisfaction.


                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 1. LOADING LIBRARIES ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Load packages from library (assuming these are already installed...)
library(geomorph) # geomorph 3.0.6
library(shapes) # shapes 1.2.3

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 2. READING IN THE DATA ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Set working directory
setwd("C:\\FILEPATH") # Make sure this is the directory where you have downloaded the lances_GMM.csv datafile


# Read the datafile "lances_M" containing a matrix of dimensional data (metric)
lances_M<-read.csv("Appendix_B.csv",header=TRUE)
# Read the datafile "lances_GMM" containing a matrix of landmark data (geometric morphometric)
lances_GMM<-read.csv("Appendix_C.csv",header=TRUE)

# Convert the 2D matrix of geometric morphometric data ("lances_GMM") into a 3D array
lances_geo<-arrayspecs(lances_GMM[,2:15],7,2) # 7 landmarks, recording 2 dimensions only (xy coordinates), ignoring the first column of lance IDs

                          #-#-#-#-#-#-#-#-#-##-#-#-#-#-#-#-#-#-
                          #### 3. METRIC ANALYSIS: SUMMARY ----
                          #-#-#-#-#-#-#-#-#-##-#-#-#-#-#-#-#-#-

# For calculating the coefficient of variation (CV %), the formula is: (standard deviation/mean) x 100
# Histograms, means and kernel densitiy estimations can easily be calculated and plotted using base R functions.

# Before undertaking any descriptive statistics of the metric dimensions of the lances, it is important to re-sort the data matrix and subset the data.
lances_M$site<-factor(lances_M$site,
                    levels = c("Ejsbol","Nydam", "Illerup"),
                    labels = c("Ejsbol","Nydam", "Illerup"),
                    ordered=T)                                # This simply converts the variable 'site' into an ordered variable of factors with levels.

# The data can be subset into specific features of the lance, so that only cases with complete data are used
blade<-subset(lances_M, point=='yes')                                 # Selects all cases with complete blades
socket<-subset(lances_M, socket=='yes')                               # Selects all cases with complete sockets
total<-subset(lances_M, point=='yes' & socket=='yes')                 # Selects all 'complete' lances with all features

# Pairwise correlations of lance features
cor(socket$socket_length,socket$sock_bdiam,use="pairwise.complete.obs") # 0.52
cor(socket$sock_bdiam,socket$sock_sdiam,use="pairwise.complete.obs")    # 0.52
cor(lances_M$width,lances_M$thickness,use="pairwise.complete.obs")      # 0.53
cor(blade$blade_length,blade$width,use="pairwise.complete.obs")         # 0.58
cor(blade$blade_length,blade$thickness,use="pairwise.complete.obs")     # 0.47

# Principal Components Analysis of Havor lance dimensions
totalpca<-prcomp(~total_length+blade_length+socket_length+sock_bdiam+sock_sdiam+width+thickness,data=total,center=T,scale=T)
totalpca        # By typing 'totalpca' a full summary of the components is printed in the terminal.
str(totalpca)   # More information can be viewed about the PCA results by looking at the 'total' object in more detail.

# Heirarchical Cluster Analysis of Havor lance dimensions
totalhc <-hclust(dist(total[,(c(1,5:11))]), "average")  # The cluster analysis is performed
totalhc1<-as.dendrogram(totalhc)                        # The cluster analysis results are converted into a dendrogram object
plot(totalhc1)                                          # Plots the resulting dendrogram object
  
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 4. GEOMETRIC MORPHOMETRICS (GMM): LANDMARKS DATA ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Create the links (this specifies the order of landmarks by which to connect linking lines)
outline<-rbind(c(1,2),c(2,3),c(3,4),c(4,5),c(5,6),c(6,7),c(7,1))

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 5. GMM DATA MANIPULATION ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Subset the data into different sites
Eco<-lances_geo[,,1:6]    # Ejsbol (n=6)
Nco<-lances_geo[,,7:30]   # Nydam (n=24)
Ico<-lances_geo[,,31:78]  # Illerup (n=48)

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
                          #### 6. PLOTTING DIGITISED SPECIMENS ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

# This function plots the landmarks of specimens recorded (as digitised)
plotAllSpecimens(lances_geo,links=outline)  # Plot landmarks of all specimens (digitised)
plotAllSpecimens(Eco,links=outline)         # Plot landmarks of Ejsbol lances (digitised)
plotAllSpecimens(Nco,links=outline)         # Plot landmarks of Nydam lances (digitised)
plotAllSpecimens(Ico,links=outline)         # Plot landmarks of Illerup lances (digitised)

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 7. GENERALISED PROCRUSTES ANALYSIS (GPA) ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# GPA is performed on the lances, including the semi-landmarks at the socket.
# The 'curves' argument is ignored to have permanent landmarks
lancespr<-gpagen(lances_geo)  # GPA of all lances
Epr<-gpagen(Eco)              # GPA of Ejsbol lances
Npr<-gpagen(Nco)              # GPA of Nydam lances
Ipr<-gpagen(Ico)              # GPA of Illerup lances

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
                          #### 8. PLOTTING GPA SPECIMENS ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

# This function plots the landmarks of GPA specimens
plotAllSpecimens(lancespr$coords,links=outline) # Plot landmarks of all specimens (GPA)
plotAllSpecimens(Epr$coords,links=outline)      # Plot landmarks of Ejsbol lances (GPA)
plotAllSpecimens(Npr$coords,links=outline)      # Plot landmarks of Nydam lances (GPA)
plotAllSpecimens(Ipr$coords,links=outline)      # Plot landmarks of Illerup lances (GPA)

# This function plots the shapes of GPA specimens
plotshapes(lancespr$coords,joinline=c(1:7,1),symbol=NA) # Plot shapes of all specimens (GPA)
plotshapes(Epr$coords,joinline=c(1:7,1),symbol=NA)      # Plot shapes of Ejsbol lances (GPA)
plotshapes(Npr$coords,joinline=c(1:7,1),symbol=NA)      # Plot shapes of Nydam lances (GPA)
plotshapes(Ipr$coords,joinline=c(1:7,1),symbol=NA)      # Plot shapes of Illerup lances (GPA)

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 9. ALLOMETRY: CHECKING IF SHAPE IS RELATED TO SIZE ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Manually create a vector containing site
site<-as.factor(c(rep("Ejsbøl",6),rep("Nydam",24),rep("Illerup",48)))
site<-factor(site,levels=c("Ejsbøl","Nydam","Illerup")) # Create a vector for the different sites

# Create a geomorph data frame for analysis
lances_geomorph<-geomorph.data.frame(shape=lancespr$coords,site=site,size=lancespr$Csize,ind=lances_GMM$site_lance.id) # Parse the data into a geomorph data frame

# We can test to see if there is an association between centroid size and shape, before conducting further statistical analyses.
# The results are significant, but they cannot be explained by site difference
lances_ANOVA<-procD.allometry(shape ~ size, ~site, data=lances_geomorph,method="PredLine") # Optional right-hand formula for the inclusion of groups; "~site" can be removed to perform ANOVA on whole dataset
# lances_ANOVA<-procD.allometry(shape ~ size, data=lances_geomorph,method="PredLine") # As above, but with "~site" removed
plot(lances_ANOVA)
print(lances_ANOVA)

#Call:
#  procD.allometry(f1 = shape ~ size, f2 = ~site, data = lances_geomorph,      method = "PredLine") 
#
#Homogeneity of Slopes Test
#Df     RSS       SS      Rsq      F       Z Pr(>F)
#Common Allometry  74 0.76683                                        
#Group Allometries 72 0.74137 0.025466 0.030754 1.2366 0.67153  0.246
#
#The null hypothesis of parallel slopes is supported
#based on a significance criterion of alpha = 0.05 
#
#Based on the results of this test, the following ANOVA table is most appropriate
#
#Type I (Sequential) Sums of Squares and Cross-products
#Randomized Residual Permutation Procedure Used
#1000 Permutations
#ANOVA effect sizes and P-values based on empirical F distributions
#
#Df      SS       MS     Rsq      F        Z Pr(>F)  
#log(size)  1 0.05502 0.055024 0.06645 5.3098  1.91423  0.015 *
#  site       2 0.00619 0.003096 0.00748 0.2987 -0.80096  0.796  
#Residuals 74 0.76683 0.010363 0.92607                         
#Total     77 0.82805                                          
#---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 10. TESTING FOR MEAN SHAPE DIFFERENCE: HOTELLING T^2 STATISTIC AND GOODALL F STATISTIC ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# For testing the difference in mean shape (between sites) we use the raw digitised coordinates.
# By using 'scale=TRUE' in our argument, procrustes (with scaling) is carried out in the procedure.

test1<-testmeanshapes(Eco,Nco,resamples=1000,replace=TRUE,scale=TRUE) # Comparing the mean shape of Ejsbol with Nydam
# Results:
# Hotelling T^2 statistic: F=3.595 P=0.099
# Goodall F statistic: F= 0.084 P= 0.806

test2<-testmeanshapes(Eco,Ico,resamples=1000,replace=TRUE,scale=TRUE) # Comparing the mean shape of Ejsbol with Illerup
# Results:
# Hotelling T^2 statistic: F=5.746 P=0.004
# Goodall F statistic: F= 0.752 P= 0.430

test3<-testmeanshapes(Ico,Nco,resamples=1000,replace=TRUE,scale=TRUE) # Comparing the mean shape of Illerup with Nydam
# Results:
# Hotelling T^2 statistic: F=0.713 P=0.739
# Goodall F statistic: F= 0.829 P= 0.490

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
                          #### 11. PROCRUSTES ANALYSIS OF VARIANCE (ANOVA) ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

# The Procrustes ANOVA is identical to permutational-MANOVA.
# We want to perform statistical tests for mean shape difference on the GPA specimens.

# Procustres ANOVA
lances_ANOVA2<-procD.lm(shape~site,data=lances_geomorph, iter=99)
print(lances_ANOVA2)

#Call:
#  procD.lm(f1 = shape ~ site, iter = 99, data = lances_geomorph)
#
#Type I (Sequential) Sums of Squares and Cross-products
#Randomized Residual Permutation Procedure Used
#100 Permutations
#ANOVA effect sizes and P-values based on empirical F distributions
#
#Df      SS        MS     Rsq      F        Z Pr(>F)
#site       2 0.01286 0.0064307 0.01553 0.5917 -0.44955    0.7
#Residuals 75 0.81519 0.0108691 0.98447                       
#Total     77 0.82805       

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
                          #### 12. PRINCIPAL COMPONENTS ANALYSIS (PCA) OF GENERALISED PROCRUSTES ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

# PCA is carried out on procrustes aligned specimens.
lancespca<-plotTangentSpace(lancespr$coords,label=TRUE)
lancespca       # By typing 'lancespca' a full summary of the components is printed in the terminal.
str(lancespca)  # More information can be viewed about the PCA results by looking at the 'lancespca' object in more detail.

                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
                          #### 13. HEIRARCHICAL CLUSTER ANALYSIS (HCA) OF GENERALISED PROCRUSTES ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

# HCA is carried out on procustes aligned specimens.
hc<-hclust(dist(two.d.array(lancespr$coords)), "average")  # The cluster analysis is performed
hc1<-as.dendrogram(hc)                  # The cluster analysis results are converted into a dendrogram object
plot(hc1)                               # Plots the resulting dendrogram object


                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
                          #### 14. BILATERAL SYMMETRY INVESTIGATION ----
                          #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

# Define a matrix of the paired landmarks (i.e. S1 and S2, N1 and N2, W1 and W2)
lances_land.pairs<-matrix(c(1,7,2,6,3,5),nrow=3,ncol=2,byrow=TRUE)

# Perform an analysis f the directional and fluctuating asymmetry of Havor lances
lance.sym<-bilat.symmetry(A=shape,ind=ind,object.sym=TRUE,land.pairs=lances_land.pairs,data=lances_geomorph,RRPP=FALSE,iter=999)

# View the results (ANOVA table)
lance.sym

#Call:
#  bilat.symmetry(A = shape, ind = ind, object.sym = TRUE, land.pairs = lances_land.pairs,  
#                 data = lances_geomorph, iter = 999, RRPP = FALSE) 
#
#Symmetry (data) type: Object 
#
#Type I (Sequential) Sums of Squares and Cross-products
#Randomization of Raw Values used
#1000 Permutations
#
#Shape ANOVA
#Df      SS        MS     Rsq        F       Z Pr(>F)   
#ind        77 1.55153 0.0201498 0.99820 577.3822 23.2156  0.001 **
#  side        1 0.00011 0.0001059 0.00007   3.0349  1.3652  0.063 . 
#Residuals  77 0.00269 0.0000349 0.00173                           
#Total     155 1.55433                                             
#---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Plot the results
plot(lance.sym, warpgrids=TRUE)

#### Notes ----
# For more information about the graphical display of biplots used in the publication, using base plotting functions in R,
# please contact the author.


