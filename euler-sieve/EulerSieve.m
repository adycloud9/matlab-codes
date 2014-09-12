%1. b.Function to construct Euler Sieve using boolean arrays
function [L]= EulerSieve2(n)
    
    p=2;
%Initializing vector L
    L=ones(1,n);
    L(1)=0;
    disp(L);

     while(p^2<=n)
        %Initializing boolean vectors L1 and L2 for each iteration
        L1=zeros(1,n);
        L2=zeros(1,n);
        x=n/p;
        
        %Finding L1
        for i=p:x
         if(L(i)==1)
         L1(i)=1;
         end
        end
        
        %Finding L2
       for i=1:n
        if(L1(i)==1)
        L2(p*i)=1;
        end
       end
     
       %Finding new L
       for i=1:n
         if(L2(i)==1)
          L(i)=0;
         end
       end
       
     %Finding next value in L
     j=p+1;
     
     while(L(j)==0)
        j=j+1;
     end

     p=j;
     end
     
end