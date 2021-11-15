# Food Prices Clustering


### Readme Table of Contents
* [Unstandardized Single Linkage Clustering]()
* [Explore the Data]()
* []()
* []()
* []()
* []()
* []()
* []()



# Unstandardized Single Linkage Clustering
The goal of any clustering is to identify and characterize underlying subgroups between our individual observations. Single linkage clustering is considered hierarchical clustering which minimizes the euclidean distance between all points in the data set. An initial cluster is created from the points closest to each other. The nearest clusters are merged in a repetitive process until a single cluster is formed. Though this method is simple, there is no way to really check the quality of the clustering fit, and we cannot tailor it to specific criteria. Therefore, I would do K-means clustering on this dataset if I had to pick between single linkage and k means. For purposes of exploration however, I explore the dataset using both single linkage and K means clustering.

## Explore the Data
The data provides food prices (in cents) in different US cities during the 1970s. There are 24 different cities with 5 different food categories. On average, Butter is the most expensive food (mean 144.2), and Bread is the least (Mean 38.44). Bread and Hamburger prices are highly correlated (.649), and Tomato and Hamburger prices are the second most correlated (.556). Apples and Tomato are the least correlated (.133).The high correlation between Bread and Hamburger could be because they are often paired together at meals, and therefore often sold together. Their supply and demand fluctuations may be related because of this, and therefore their prices would be. Note that there are no negative correlations in this data set. In general, above average food prices are associated with each other, likely due to relatively similar costs (compared with non perishable, nonfood items) in production, transportation, and distribution. The covariance matrix reveals that Hamburgers have the largest price variation (135.33) in prices. Butter has the second largest variation (85.14). Bread and Apples have similar variation (70; 69.87), and Tomato has the least variation (54.74). Added together, the sum of all variance in the data is 415.08. In  terms of the percent of variation each variable accounts for in the data, Hamburger accounts for the largest percent (32.6%) of the total variance in the data, while Bread (16.8%) and Apples (16.8%) have nearly identical percentages, and Tomato has the lowest (13%). The city of Anchorage has the highest total food prices, followed by Honolulu and Philadelphia. Buffalo has the lowest total food prices, followed by San Diego and Los Angeles.
