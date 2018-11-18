clear ; close all; clc
fileID = fopen('grades.txt');
C = textscan(fileID,'%f %s %s %f %f %f');
fclose(fileID);
plot(C{1,4}, C{1,5}, 'rx', 'MarkerSize', 10); 
hold on; % keep previous plot visible
plot(C{1,4}, C{1,6}, 'ox', 'MarkerSize', 10); 
hold off

xlim([0 inf]); %start x axis on 0

y = C{1,6};
m = length(y);
newrow = C{1,6};
X = [ones(m, 1), C{1,4}]; % Add a column of ones to x
y = [y;C{1,5}];
X = [X;X]; 
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.029;

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

hold on; % keep previous plot visible
plot(X(:,2), X*theta,'g-');
legend('Midterm', 'Finals','Regression Line');
hold off % don't overlay any more plots on this figure
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
theta0_vals = linspace(10, 100, 100);
theta1_vals = linspace(-5, 25, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end
J_vals = J_vals';

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');


% Contour plot
figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);