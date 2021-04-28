function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%
%Ultimate goal is to find the 0!
%While typically superior to the bisection method, check by hand to
%guarantee the results you want. If not, look into the bisect() function
%for cross reference
%
%Inputs:
%   func = user inputs the function that they wish to have evaluated
%   xl = Users lower guess for the root
%   xu = Users upper guess for the root
%   es = Users desired relative error, Type as a percentage (defaults to 0.0001%)
%   maxit = Maximum number of iterations this program will use (defaults
%   to 200)
%   varargin = allows program to accept any number of input arguments
%
%Outputs:
%   root = Estimated root location
%   fx = function that got evaluated at said location of root
%   ea = approximate relative error (%)
%   iter = the number of iterations which were preformed

%%
%This section tests the number of variables user inputted and preforms
%various options if need be!
if nargin<3
    error('There needs to be ATLEAST 3 input variables')
end

if nargin<5||isempty(maxit)%This function tests to see if the variable spot is empty!
    maxit=50;
end

if nargin<4||isempty(es)
    es=0.0001;
end

xr=xl; %xr is going to be what gets plugged back into the equation later



es=es*.01;%Changes a percentage to decimal

iter=0; %This will be used to test what iteration we're on to compare with maxit
ea=100;%This is the starting percentage for ea
%%
%This is where we begin iterating and plugging things in
while ea>es && iter<=maxit
     
    
    originalxr=xr;%storing current xr in old variable to cross reference
    
    xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));%Finding the new xr by plugging in formula
    
    if xr~=0 %if it was equal to zero then we can just stop cause error would be zero
        ea=(abs((xr-originalxr)/xr))*100;
    else
        ea=0;
        
    end
    
    %This is going to test to see if there's a sign change here
    if func(xu)*func(xr)<0
        xl=xr;
    elseif func(xl)*func(xr)<0
        xu=xr;
    else
        ea=0;
    end
    
 iter=iter+1;
    
    
end

%%
%Displays things to the command window

fx=func(xr);
root=xr;
ea=ea*100;%Throws back into a percentage
if root==Inf
    error('Function either doesnt cross zero OR two zeros are in bounds')
end

%Displays values in command window
fprintf('This equations root is: %d\n', root);
fprintf('Approximate relative error: %d\n',ea);
fprintf('Number of iterations: %d\n',iter);


end


