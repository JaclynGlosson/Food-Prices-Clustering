# Food Prices Clustering


### Readme Table of Contents
* [Unstandardized Single Linkage Clustering]()
* [Explore the Data]()
* [Compute a distance matrix and run hclust()]()
* [Plot Dendrogram]()
* [Choose number of clusters]()
* [Get cluster centers]()
* [Calculate sum of total sum of squares]()
* [Unstandardized K-Means Clustering](
* []()
* []()
* []()
* []()
* []()



# Unstandardized Single Linkage Clustering
The goal of any clustering is to identify and characterize underlying subgroups between our individual observations. Single linkage clustering is considered hierarchical clustering which minimizes the euclidean distance between all points in the data set. An initial cluster is created from the points closest to each other. The nearest clusters are merged in a repetitive process until a single cluster is formed. Though this method is simple, there is no way to really check the quality of the clustering fit, and we cannot tailor it to specific criteria. <b> Therefore, I would do K-means clustering on this dataset if I had to pick between single linkage and k means. For purposes of exploration however, I explore the dataset using both single linkage and K means clustering.</b>

## Explore the Data
The data provides food prices (in cents) in different US cities during the 1970s. There are 24 different cities with 5 different food categories. On average, Butter is the most expensive food (mean 144.2), and Bread is the least (Mean 38.44). Bread and Hamburger prices are highly correlated (.649), and Tomato and Hamburger prices are the second most correlated (.556). Apples and Tomato are the least correlated (.133).The high correlation between Bread and Hamburger could be because they are often paired together at meals, and therefore often sold together. Their supply and demand fluctuations may be related because of this, and therefore their prices would be. Note that there are no negative correlations in this data set. In general, above average food prices are associated with each other, likely due to relatively similar costs (compared with non perishable, nonfood items) in production, transportation, and distribution. The covariance matrix reveals that Hamburgers have the largest price variation (135.33) in prices. Butter has the second largest variation (85.14). Bread and Apples have similar variation (70; 69.87), and Tomato has the least variation (54.74). Added together, the sum of all variance in the data is 415.08. In  terms of the percent of variation each variable accounts for in the data, Hamburger accounts for the largest percent (32.6%) of the total variance in the data, while Bread (16.8%) and Apples (16.8%) have nearly identical percentages, and Tomato has the lowest (13%). The city of Anchorage has the highest total food prices, followed by Honolulu and Philadelphia. Buffalo has the lowest total food prices, followed by San Diego and Los Angeles.

![](https://github.com/JaclynGlosson/Food-Prices-Clustering/blob/b48f645b2981ea2e7733da97183874fe617beb6f/images/image7.png)

## Compute a distance matrix and run hclust()
![](https://github.com/JaclynGlosson/Food-Prices-Clustering/blob/b48f645b2981ea2e7733da97183874fe617beb6f/images/image8.png)

## Plot Dendrogram
![](https://github.com/JaclynGlosson/Food-Prices-Clustering/blob/b48f645b2981ea2e7733da97183874fe617beb6f/images/image1.png)

Those cities that are lower on the tree are the most similar. For instance, Cleveland and St Louis are most similar, as they have a distance of 6.7 between them according to our distance matrix. The second closest pair of cities is Minneapolis and Pittsburgh, with a distance of 7.8 between them. When I check the raw data, I can see visually that the pairs of cities are indeed similar. The distances are represented by the left hand axis, therefore the height of the branch represents the distance between the two cities. Note that Anchorage and Kansas City are close to each other on the diagram, yet have a large distance between them.

## Choose number of clusters
When I choose four clusters, I see that three of the clusters have one city, and one cluster contains the rest of the cities. Cluster 1 is Anchorage, cluster 3 is Buffalo, and cluster 4 is Kansas City. As the sum of food prices in Anchorage and Buffalo are the highest and lowest in all the dataset, it makes sense that the distance between them and other values is large. Kansas City, though not an outlier, does have Hamburger and Apples prices a SD away from the mean, and Butter prices 2 SD away from the mean, which is not found in most other rows, besides our aforementioned outliers.Therefore it’s dendrogram position and subsequent clustering makes sense relative to the other data. The interpretability of this clustering analysis is low to none, since nearly all cities are in the same cluster, and as noted prior to begining the analysis, single linkage cluster method is not the best analysis for this data. However, it does allow us to identify outliers, as well as similar cities. But holistically, this analysis should not be taken at face value.

![](https://github.com/JaclynGlosson/Food-Prices-Clustering/blob/b48f645b2981ea2e7733da97183874fe617beb6f/images/image2.png)

## Get cluster centers
Notice that for cluster 2, these values are all extremely close to the mean for each variable. This is because this cluster has nearly all the data in it, and therefore it’s average is similar to the average of the entire dataset. As clusters 1, 3, and 4 contain one city, the cluster center is equivalent to each of the city’s mean prices in the original data.

## Calculate sum of total sum of squares
Clusters 1,3, and 4 all have total sum of squares of zero, which makes perfect sense given that they all contain one city’s data. Therefore, there is no “residual” between data points with which to square. Cluster two has a sum of squares of 303096, and given that this cluster contains all but 3 observations, the fit is not very good, thus the SS is large. The total SS is 303,096 for the entire analysis - again not a great fit. 

# Unstandardized K-Means Clustering
