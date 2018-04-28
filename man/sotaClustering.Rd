\name{sotaClustering}
\alias{sotaClustering}
\title{SOTA Clustering}
\description{
Self-organizing Tree Algorithm (SOTA) introduced by [Herrero et al., 2001].
}
\usage{
sotaClustering(Data, ClusterNo,PlotIt=FALSE,...)
}

\arguments{
\item{Data}{[1:n,1:d] matrix of dataset to be clustered. It consists of n cases or d-dimensional data points. Every case has d attributes, variables or features.}

\item{ClusterNo}{A number k which defines k different Clusters to be build by the algorithm.}
\item{PlotIt}{default: FALSE, If TRUE plots the first three dimensions of the dataset with colored three-dimensional data points defined by the clustering stored in \code{Cls}}
\item{\dots}{Further arguments to be set for the clustering algorithm, if not set, default arguments are used.}
}
\value{
List of
\item{Cls}{[1:n]  numerical vector with n numbers defining the classification as the main output of the clustering algorithm. It has k unique numbers representing the arbitrary labels of the clustering.}
\item{sotaObject}{Object defined by clustering algorithm as the other output of this algorithm}
}

 \examples{
data('Hepta')
out=sotaClustering(Hepta$Data,ClusterNo=7,PlotIt=TRUE)
}
\author{Michael Thrun}

\references{
[Herrero et al., 2001]  Herrero, J., Valencia, A., & Dopazo, J.: A hierarchical unsupervised growing neural network for clustering gene expression patterns, Bioinformatics, Vol. 17(2), pp. 126-136. 2001.

}