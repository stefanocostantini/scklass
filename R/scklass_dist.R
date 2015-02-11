# ----------------------------------------------------------------------
# Functions to carry out k-NN classification and linear classification
# ----------------------------------------------------------------------
#' Distance calculation
#' 
#' Calculates the distances from each observation in a data set (for example the test set) to every data point in a dataset (for example the training set). The two datasets could be the same when no test set is available.
#' 
#' @param train_data A data frame or a matrix where rows are observations and columns are features. This is the dataset to which distances are calculated (the training set) 
#' @param test_data A data frame or a matrix where rows are observations and columns are features. This is the dataset from which distances are calculated (the test set)
#' @param p The type of distance being calculated (e.g. \code{p=2} corresponds to the Euclidean distance)
#' @return A matrix where rows are the observations in the 'From' dataset and columns are observations in the 'To' dataset and cells contain the ordering (position) of neighbours for each of the observations in the 'From' dataset.
#' @examples
#' # create artificial dataset
#' train_data <- matrix(rnorm(200), ncol=2)
#' test_data  <- matrix(rnorm(50), ncol=2)
#' # calculate the Euclidean distances from each observation in \code{test_data} to every observation in \code{train_data}
#' calcDistances(train_data, test_data, p=2) 

calcDistances <- function(train_data,test_data,p=2) {
  # The default distance is the Euclidean distance
  # The function returns the matrix of distances
  
  noObs <- nrow(test_data) # calculate number of observations to loop through
  noMemory <- nrow(train_data) # calculate the number of points to consider in
  distanceMatrix <- matrix(NA, noObs, noMemory) #initialise the distance matrix
  
  for (obs in 1:noObs) {
    # getting the probe for the current observation
    probe <- as.numeric(test_data[obs,1:2]) 
    probeExtended <- matrix(rep(probe, each=noMemory), nrow=noMemory)
    distanceMatrix[obs, ] <- (rowSums(abs(train_data[,1:2]-probeExtended)^p))^(1/p)
  }
  
  # Define the order of the neighbours based on their distance
  neighbours_pre <- apply(distanceMatrix, 1, order)
  neighbours <- t(neighbours_pre)
  
  return(neighbours)
}