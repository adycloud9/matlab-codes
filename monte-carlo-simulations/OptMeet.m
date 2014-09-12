
%Calculation of Optimal Meets using Monte-Carlo search

function[S,Z,C] = OptMeet(L,Q,W,P,A)

x=length(P);
y=size(P,1);
S=0;
Z=0;
C=0;

%Calculating probabilities of professors attending for the Agenda

B=zeros(1,x);

for i=1:x
    for j=1:y
        if (A(j)==true)
            B(i)=B(i)+P(j,i);
        end
    end
end

% Generating random turnouts for 100000 samples

nsamples=100000;

for i=1:nsamples
    count1=0;
    count2=0;
    
    for j=1:x
        
        p=rand(1);
        if(p<=B(j))
            
            if(j<=L)
                count1=count1+1;
            else
                count2=count2+1;
                
            end
            
        end
        
    end
    
    
    
    %Checking Successful
    if(count2<=count1 && (count1+count2)>=Q)
        S=S+1;
        
    end
    
    %Checking pleasant
    if(count2<=W)
        Z=Z+1;
    end
    
    %Checking Successful and pleasant
    if(count2<=W && count2<=count1 && (count1+count2)>=Q)
        C=C+1 ;
    end
end

S=S/nsamples;
Z=Z/nsamples;
C=C/Z;
C=C/nsamples;



end