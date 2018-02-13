source('Herman74.cor')
herman74 <- Harman74.cor$cov
herman74
library(psych)
#Input the raw data matrix to fa.parallel() function to determine the numberof components to extract
fa.parallel(herman74,n.obs = 145,fa='both',n.iter=100,show.legend=FALSE,main='Screen plot with PA')

#Input the raw data matrix to fa() function to extract the components. If rawdata is input, the correlation matrix is automatically calculated by fa() function.
fa <- fa(herman74,nfactors = 4,rotate = 'none',fm='pa',score = TRUE)
fa

#Rotate the factors
fa.varimax <- fa(herman74,nfactors = 2,rotate = 'varimax',fm='pa',socre = TRUE)
fa.varimax

#Compute factor scores
fa.varimax$weights

#Graph an orthogonal solution using factor.plot()
factor.plot(fa.varimax,labels = row.names(Orthogonal$loadings))

#Graph an oblique solutions using fa.diagram()
fa.promax <- fa(herman74,nfactors = 4,rotate = 'promax',fm='pa')
fa.diagram(fa.promax,simple = FALSE)