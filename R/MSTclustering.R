MSTclustering=function(DataOrDistances,DistanceMethod="euclidean",PlotIt=FALSE,...){
  # INPUT
  # DataOrDistances[1:n,1:d]    Dataset with n observations and d features or distance matrix with size n
  # OPTIONAL
  # DistanceMethod     Choose distance metric.
  # PlotIt     Boolean. Decision to plot or not
  # 
  # OUTPUT
  # Cls[1:n]          Clustering of data
  # Object            Object of mstknnclust::mst.knn algorithm
  #
  # Author: MT
  if (!requireNamespace('mstknnclust',quietly = TRUE)) {
    message(
      'Subordinate clustering package (mstknnclust) is missing. No computations are performed.
            Please install the package which is defined in "Suggests".'
    )
    return(
      list(
        Cls = rep(1, nrow(DataOrDistances)),
        Object = "Subordinate clustering package (mstknnclust) is missing.
                Please install the package which is defined in 'Suggests'."
      )
    )
  }
  
  if(!is.matrix(DataOrDistances)){
    warning('DataOrDistances is not a matrix. Calling as.matrix()')
    DataOrDistances=as.matrix(DataOrDistances)
  }
  if(!mode(DataOrDistances)=='numeric'){
    warning('Data is not a numeric matrix. Calling mode(DataOrDistances)="numeric"')
    mode(DataOrDistances)='numeric'
  }
  AnzData = nrow(DataOrDistances)
  
  if (!isSymmetric(unname(DataOrDistances))) {
    if(requireNamespace("parallelDist",quietly = TRUE)){
      Distances=as.matrix(parallelDist::parDist(DataOrDistances,method=DistanceMethod))
    }else{
      warning("Please install the parallelDist package, using dist()")
      Distances=as.matrix(dist(DataOrDistances,method=DistanceMethod))
    }
  }else{
    Distances=DataOrDistances
  }
  results <- mstknnclust::mst.knn(distance.matrix = Distances,...)
  Cls=results$cluster
  if(isTRUE(PlotIt)){
	ClusterPlotMDS(DataOrDistances,Cls)
  }
  Cls=ClusterRename(Cls,DataOrDistances)
  return(list(Cls=Cls,Object=results))
}