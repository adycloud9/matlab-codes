%Function ProbFullUrn takes tarnsition matrix T and N and returns vector P that
%gives probability that the urn will become full on or before the Ith Flip

function [P] =ProbFullUrn(T,N)

len=length(T);

%Modifying Transition matrix so that final state can transition only to itself

for i=1:len

if(i==len)
T(i,len)=1;
else
T(i,len)=0;
end

end

%Initializing vector V and P
V=zeros(1,len);
V(1,1)=1;

P=zeros(1,N);

%Computing P

for i=1:N

U=(T^i); 
X=U*V';    
P(1,i)=X(len);
end

end

