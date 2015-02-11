# scklass - A package for k-NN classification

The package can be installed in R from GitHub, using `devtools`, by running the following command.

`devtools::install_github("stefanocostantini/scklass")`

Once installed, the library is loaded by running the command:

`library(scklass)`

This package contains two functions:

1. `calcDistances`: this function is used to calculate the distance from each observation in a test dataset to every observation in a training dataset. The user can select the distance being calculated (Manhattan, Euclidean, etc.) by varying the value of the parameter `p`. If only one dataset is used, it should enter the function twice, once as test set and once as training set. See `?calcDistance` for further documentation and an example.

2. `knnClassifier`: this function carries out a k-NN classification for an arbitrary number of classes and of k. Note that it relies on the distances calculated by the `calcDistances` function. See `?knnClassifier` for further documentation and an example.

