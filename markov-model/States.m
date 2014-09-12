%Function to generate the state matrix

function [S] = States(K)

m=length(K);
q=1;

% Calculating the total number of states

for i=1:m
q=q*(K(i)+1);
end

%Initializing the matrix S

S=zeros(m,q);

x=1;

% Looping for each possible category of coins

while(x<=m)
        c=x+1;
        
        %Setting a limit till value remains constant in the row
        
        limit=1;
        while(c<=m)
            limit=limit*(K(c)+1);
            c=c+1;
        end
       
        i=1;
        j=0;
        k=1;
        
        %Populating number of coins in each state of each type
        
        while i<=q
             
           if(k==limit && j==K(x))
              S(x,i)=j;
               j=0;
               k=0;
               
           elseif(k==limit)
                  S(x,i)=j;
                   j=j+1;
                   k=0;
           else
               S(x,i)=j;
           end
         
           i=i+1;
           k=k+1;
        end
        x=x+1;
end
     
end
        
        

