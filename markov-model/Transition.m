%Function to generate the transition matrix

function [T] = Transition(S,H)

i=1;
total=0;
m=size(S,1);
q=length(S);

%Calculating the total number of coins in all categories
while(i<=m)
    total=total+S(i,q);
    i=i+1;
end


%Initializing the transition matrix
T=zeros(q,q);

i=1;

%For each transition i to j checking different cases

while(i<=q)
    j=1;
 while(j<=q)
        
%When transitioning from the first  or the last state slecting urn or
%outside with probability 1
     
         if(i==1 || i==q)
             x=1;
         else
             x=1/2;
         end
         
%Considering the case when transitioning from first to first or last to last
%state
        if((i==1 && j==1) || (i==q && j==q))
           
            val=0;
            for k=1:m
            y=(S(k,q)/total);
            z=H(k);
            if(i==1)
            val=val+(x*y*(1-z));
            else
            val=val+(x*y*z);   
            end
            end
         T(i,j)=val; 
         
%Considering the case when transitioning to the same state other than cases of first and last         
        elseif(i==j)
                
            %Calculating total number of coins in the urn in state i
                inner=0;
                for k=1:m
                    inner=inner+S(k,i);
                end
                
                val=0;
               
                for k=1:m
                     val1=0;
                     val2=0;
                     
                    if(S(k,j)<S(k,q))
                        temp=S(k,q)-S(k,j);
                        y=(temp/(total-inner));
                        z=1-H(k);
                        val1=val1+x*y*z;
                    end
                   
                    y1=S(k,i)/inner;
                    z1=H(k);
                    val2=val2+(x*y1*z1);
                    val=val+val1+val2;
                       
                end
                
                T(j,i)=val;
                
%Considering all transitions other than the above two cases        
        else
           
            inner=0;
            count=0;
           
                for k=1:m
                    inner=inner+S(k,i);
                end
                
                for k=1:m
                if(S(k,j)==S(k,i))
                    count=count+1;
                else
                    pos=k;
                end
                end
                
               
                if(count==m-1)
                    if(S(pos,j)==S(pos,i)-1)
                        y=S(pos,i)/inner;
                        z=1-H(pos);
                       
                    elseif(S(pos,j)==S(pos,i)+1)
                        y=(S(pos,q)-S(pos,i))/(total-inner);
                        z=H(pos);
                    else
                        y=0;
                        
                    end
                val= x*y*z;
                else
                val=0;
                end
                
                T(j,i)=val;
        end
            j=j+1;
end
       i=i+1; 
 end
end

