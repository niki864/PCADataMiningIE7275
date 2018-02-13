filename="vertebral.csv"
vert <- read.csv(filename)
vert 
vertog <- vert[1:6]
vertPA <- fa.parallel(vertog, fa="both", n.iter = 100, show.legend = TRUE)
cor(vertog)
#CMD Scale
d <- dist(vertog)
d
fit <- cmdscale(d,eig=TRUE,k=2)
xaxis <- fit$points[,1]
yaxis <- fit$points[,2]
points <- fit$points
plot(xaxis,yaxis,xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Multidimensional scaling")
library(psych)
#Orthogonal Solution
ortho <- fa(vertog, nfactors = 2, rotate = "varimax", fm="pa")
factor.plot(ortho, labels = rownames(vertPA$loadings))
fit$points

