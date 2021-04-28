function [m,y0,Sr,St,Sy,rSquared,coeff]=linearRegression(x,y)
%linearRegression takes points and does a variety of things to them in
%regards to linear regression. Please note that there are more things going
%on behind the scenes that might be useful (ie: mean)
%
%Inputs:
%   x: x-coords (array)
%   y: y-coords (array)
%   plot: either 'y' or 'n' for if you want a data plot!
%
%Outputs:
%   m: slope of points
%   y0: y-intercept
%   Sr: Square residuals
%   St: total sum of the squares of the residuals
%   Sy: Standard Deviation
%   rSquared: Coefficient of determination

%First some good old fashioned error checking
if nargin~=2
    error('Check inputs');
elseif length(x)~=length(y)
    error('Matricies must be same size')
end

xmean=mean(x);
ymean=mean(y);

m=(length(x)*sum(y.*x)-(sum(y)*sum(x)))/(length(x)*sum(x.^2)-(sum(x)^2));

y0=mean(y)-m*xmean;

Sr=(sum((y-y0-m*x).^2));

St=(sum((y-ymean).^2));

Sy=sqrt(St/(length(x)-1));

rSquared=(St-Sr)/St;

coeff=Sy/ymean;


end