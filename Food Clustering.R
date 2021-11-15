library(flexclust)
#install.packages('VIM')
library(class)
library(VIM)

## Read in Data
data <- read.csv("food.csv")
data
rownames(data)=data[,1]
data=data[,-1]
data

## Explore the data
summary(data2)
rho=cor(data)
rho
summary(data)
covar=cov(data)

##########################################
## Single Linkage
##########################################

## Step 1 - Compute a distance matrix
D=dist(data)
D

# Step 2 - Run hclust()
hc<-hclust(D,"single")
summary(hc)

# Step 3 - Plot dendrogram
plot(hc)

# Foods which are next to each other are most similar.  
# there is "no cluster" so to speak, but if you look at canned chicken, that is really
# close to canned tuna (they are very similar!), so you could replace one with the other

# Step 4 - choose number of clusters
memb<-cutree(hc,k=4)
memb

# Step 5 - get cluster centers
cent<-NULL
for (k in 1:4){cent<-rbind(cent,colMeans(data[memb==k,,drop=FALSE]))}
cent

## Step 6 - Calculate sum of total SS . within SS for each cluster (compare to k-means below)
one=sum((data[memb==1,,drop=FALSE]-cent[1,])^2)
two=sum((data[memb==2,,drop=FALSE]-cent[2,])^2)
three=sum((data[memb==3,,drop=FALSE]-cent[3,])^2)
four=sum((data[memb==4,,drop=FALSE]-cent[4,])^2)
tss_single=one+two+three+four  ## total sum of squares from cluster centroid (mean in this case)
# single linkage has no guarantee for fit, this could be bad.

one
two
three
four
tss_single

##########################################
## k means clustering
##########################################

# Step 1 - Run kmeans and analyze clusters
cl=kmeans(data,4)  # keep same number of clusters as before
cl
cl$tot.withinss
## of course, the within sum of squares is lower than single linkage

# Step 2 - Plot clusters
plot(data, col = cl$cluster)
points(cl$centers, col = 1:5, pch = 8)  ## this only does calories and protein
text(data,rownames(data),col=cl$cluster)

# Step 3 - Choose k  (plot total sum of squares)
tss<-rep(0,8)
for (k in 1:8){tss[k]=kmeans(data,k)$tot.withinss}
plot(1:8,tss)

# Step 4 - Interpret clusters
centers=cl$centers
centers
cl$cluster
# cluster 2 has things like hamburger and braised beef
# cluster 3 has things like broiled chicken (healthy), canned salmon, baked bluefish 

# Step 5  - Plot clusters with pca

## here we are putting food names to the clusters
pca <- prcomp(data)
pca2d( pca, group=cl$cluster)
pca2d( pca, group=cl$cluster,show.labels=TRUE, )
pca3d( pca, group=cl$cluster,show.labels=TRUE, )
pca
pca2d
pca3d
summary(PC1)
PC1<-prcomp(data,rank.=3)
PC1



##########################################
## Standardize K means 
##########################################
data=scale(data)  
summary(data)

# Step 1 - Run kmeans and analyze clusters
cl=kmeans(data,3)  # three clusters
cl
cl$tot.withinss

# Step 2 - Plot clusters
plot(data, col = cl$cluster)
points(cl$centers, col = 1:5, pch = 3 )
text(data,rownames(data),col=cl$cluster)

# Step 3 - Choose k  (plot total sum of squares)
tss<-rep(0,3)
for (k in 1:3){tss[k]=kmeans(data,k)$tot.withinss}
plot(1:3,tss)

# Step 4 - Interpret clusters
centers=cl$centers
centers
cl$cluster

# Step 5  - Plot clusters with pca
library(pca3d)
pca <- prcomp(data, scale.= TRUE) #if data is standardized. Remove scale if not
pca <- prcomp(data)
pca2d( pca, group=cl$cluster)
pca2d( pca, group=cl$cluster,show.labels=TRUE, )
pca3d( pca, group=cl$cluster,show.labels=TRUE, )
pca
pca2d
pca3d
summary(PC1)
PC1<-prcomp(data,rank.=3)
PC1