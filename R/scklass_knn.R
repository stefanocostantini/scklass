# ----------------------------------------------------------------------
# Functions to carry out k-NN classification and linear classification
# ----------------------------------------------------------------------
#' k-NN Classification
#' 
#' Carries out a k-NN classification
#' 
#' @param true_labels A vector, of the same length as the number of rows in the training dataset containing the true label of each observation in the training dataset
#' @param obs The number of observations to classify 
#' @param neighbours A matrix of distances between the test set and the training set obtained with the \code{calcDistances} function
#' @param labels A vector of unique labels/classes (needs to include all the unique labels making up the \code{true_labels} vector)
#' @param k The number of neighbours to consider in the classification
#' @return A vector with the predicted label for each observation in the test dataset
#' @examples
#' # create artificial dataset
#' train_data <- matrix(rnorm(200), ncol=2)
#' test_data  <- matrix(rnorm(50), ncol=2)
#' # create labels
#' labels <- c(1,2,3)
#' true_labels <- c(rep(labels[1],33), rep(labels[2],33), rep(labels[3],34))
#' # calculate distances
#' neighbours <- calcDistances(train_data, test_data, p=2)
#' # define the number of test observations to consider
#' obs <- nrow(test_data)
#' # carry out the k-NN classification 
#' knnClassifier(true_labels,obs,neighbours,labels,k=3)
#' 
knnClassifier <- function(true_labels,obs,neighbours,labels,k=1) {
  
count_labels <- rep(0,length=length(labels)) # Initialise vector of label count
predictedClasses <- rep(NA, obs) # initialise vector of predicted classes

for (i in 1:obs) {
  
  for (j in 1:length(labels)) {
      count_labels[j] <- sum(true_labels[neighbours[i,2:(k+1)]]==labels[j])
  }
  
  predictedClasses[i] <- labels[which.max(count_labels)] # allocate predicted label
  
}

return(predictedClasses)

}