function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix


%Error catching section and creating variables
%We need to make sure that the matrix has n equations and m unknowns
[n,m]=size(A);
L=zeros(n,m);
A_new=A;
P=zeros(n,m);


if n>m||m>n
    error('Matricies needs to be an nxm matrix where n and m are the same size');
elseif nargin ~= 1
    error('You need one input');
end

for c=1:n
    
    P(c,c)=1; %Do the same thing for the P matrix, that way we can keep track of pivots
end

%This is the process of solving the matricies
for f=1:(n)
    
    [maxvalue,locate]=max(abs(A_new(f:n,f)));%This is what allows us to check if we should partially pivot!
    pivotCheck=f+locate-1;
    if (pivotCheck) > 1%Checks to see if we need to pivot our matrix!
        tempPrimeRow=A_new(f,:);%Creates a temporary row that is the one that we will be replacing
        A_new(f,:)=A_new(pivotCheck,:);%Replacing row
        A_new(pivotCheck,:)=tempPrimeRow;%Plugging old row back in
        
        %We need to also adjust the P matrix so that way the user knows
        %what was flipped!
        tempPRow=P(f,:);
        P(f,:)=P(pivotCheck,:);
        P(pivotCheck,:)=tempPRow;
        
        tempLRow=L(f,:);
        L(f,:)=L(pivotCheck,:);
        L(pivotCheck,:)=tempLRow;
        
        %might not use this, if so though, it will appear below when we eliminate variables
    end %PIVOTING IS DONE (about time)
    
    L(f:n,f)=A_new(f:n,f)/A_new(f,f);%Finds our lower matrix by dividing 
    A_new(f+1:n,1:n)=A_new(f+1:n,1:n)-L(f+1:n,f)*A_new(f,1:n);%Proceeds with elimination. Subtracts the bottom from the top which was multiplied by the L
    
    
end
U=A_new;
end
