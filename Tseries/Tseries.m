function [result,order,error,et]=Tseries(f,xi,xiplus,es,maxit)
%Program that takes the taylor series for you! Pretty nifty time saver
%(always should be double checked)
%
%Inputs:
%   f-a symbolic function with an f(x)
%   xi-Value we know
%   xiplus-Value we want to solve for
%   es-Relative error that the user wants (auto 0.1%) (type as %
%   maxit-max orders the user wants to take it to (auto 10)
%
%Outputs:
%   Result: Number at this point
%   Order: What order we're at
%   error: Whats our error (%)
%   et: total error
if nargin<3
    error('requires at least 3 terms');
elseif isempty(es)
    es=0.1;
elseif isempty(maxit)
    maxit=10;
end

%convert es to a decimal
es=es*0.01;
ea=100;
a=xi;
h=abs(xi-xiplus);
iter=-1;
result=0;
actual=f(xiplus);
while iter<maxit && ea>=es
iter=iter+1;
resultnew=(f(xi)/factorial(iter))*(h^iter);

resulttemp=result+resultnew;

f=diff(f);

ea=abs((resulttemp-result)/resulttemp);
result=resulttemp;

end
order=iter;
error=abs(ea*100);

et=abs((actual-result)/actual);
end



    