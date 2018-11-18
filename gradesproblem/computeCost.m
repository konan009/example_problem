function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
  m = size(X,1);
  predictions = X*theta;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
  sqrErrors = (predictions-y).^2;
  J = 1/(2*m) * sum(sqrErrors);
% =========================================================================

end
