function [X] = featureUnNormalize(X_norm, mu, sigma)
%rescales a normalized feature into its original size according to
% mu = mean value of feature
% sigma = standard deviation of feature
%
% X_norm shold be a vector or matrix with a column for each feature

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

    X = bsxfun (@times, X_norm, sigma);
    X = bsxfun (@plus, X, mu);
end
