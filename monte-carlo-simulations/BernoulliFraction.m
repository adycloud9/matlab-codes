%Function BernoulliFraction(N,T) calculates fraction of Singular N X N
%Bernoulli matrices

function [P] = BernoulliFraction(N,T)

A=zeros(N,N);
total=0;

%Check for T trials

for i=1:T
for j=1:N
    for k=1:N
       
        r=round(rand(1)); 
         % Taking random power of -1 i.e(-1^0 or -1^1)
        A(j,k)=(-1).^(r);
        
    end
end

%Checking Singular
if(rank(A)<N)
total=total+1;
end
end

%Fraction of Singular
P=total/T;

end

