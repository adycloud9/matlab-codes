% Function to compute the stationary distribution

function Stationary(T)

len=length(T);
Q= T- eye(len);

for i=1:len
Q(len+1,i)=1;
end

x=zeros(1,len+1);
x(1,len+1)=1;

P=Q\x';

disp(P)
end

