function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated



%Starting with some nice error checking so we can get off to a nice start!

if nargin~=2%Makes sure two inputs are present
    error('Two inputs are required')
end

if length(x)~=length(y)%Checks to make sure dimensions agree
    error('Dimensions MUST agree')
end
xtest=linspace(x(1),x(length(x)),length(x));
if sum(xtest)~=sum(x)
    error('Check x space')
end





oddeven=rem((length(x)-1),2);

if oddeven==1 && length(x)==2
    warning('Trapezoid necissary for last interval')
    xnew=0;
    ynew=0;
    xend=x;
    yend=y;
elseif oddeven==1 %This tests if there are an odd number of integrals if there are, next line will run
    warning('Trapezoid necissary for last interval')
    chopsize=3*floor(((length(x))/3));%Chopsize is here so we know how big things are
    xend=x(1,(length(x)-1:length(x)));
    xnew=x(1,1:chopsize);
    yend=y(1,(length(x)-1:length(x)));
    ynew=y(1,1:chopsize);
   
       
else
    xnew=x;
    ynew=y;
end

%Now we're moving on to some actual opperations for the simpson's 1/3 rule!
%Finding our A and B values!
Inew=0;

for count=1:2:length(xnew)-2
    a=xnew(0+count);
    b=xnew(2+count);
    
    I=((b-a)/6)*(ynew(0+count)+4*(ynew(1+count))+ynew(2+count));
    Inew=I+Inew;
    
end

if oddeven==1
    a=xend(1);
    b=xend(2);
    I=(b-a)*((yend(1)+yend(2))/2);
    Inew=Inew+I;
end


I=Inew;%Final step, change the Inew we got to I to be displayed for user!

end