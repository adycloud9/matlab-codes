% Function SphereIntersect(P,Q,R,S,T,W) calculates volume of sphere
% intersection using Monte-Carlo method

function [CI] = SphereIntersect(P,Q,R,S,T,W)

n=length(P);
CI=zeros(1,2);
B=zeros(1,n);
C=zeros(1,n);
sum=0;

%Finding the distance between center of the 2 spheres

for i=1:n
   sum =sum+((P(i)-Q(i)).^2);
end

%Checking if distance between centers of the spheres is greater than the
%sum of the 2 radii

if(sqrt(sum)>(R+S))
    %Returns uninitialized confidence interval [0,0]
    return;
else
%Calculating Box intervals B(i) and C(i)
for i=1:n
    p=P(i)-R;
    q=Q(i)-S;
    x=P(i)+R;
    y=Q(i)+S;
    
    if(p>q)
    B(i)=p;
    else
    B(i)=q;
    end
    
    if(x<y)
    C(i)=x;
    else
    C(i)=y;
    end
    
end

X=zeros(1,n);
count=0;


for i=1:T
 
    %Generating point in the Box for each trial
    for j=1:n
       X(j)= B(j)+(C(j)-B(j))*rand(1); 
    end
    
    sum1=0;
    sum2=0;
    
    %Finding distance of point from the 2 centers
    for j=1:n
    sum1 =sum1+((X(j)-P(j)).^2);
    sum2 =sum2+((X(j)-Q(j)).^2);
    end
    dist1=sqrt(sum1);
    dist2=sqrt(sum2);
    
    %If distance is less than both the radii it means it lies in the volume
    %of intersection
    if(dist1<=R && dist2<=S)
    count=count+1;
    end
    
end

%Calculating fraction of trials that lie in the volume of intersection
f=count/T;

%Standard Deviation
sd=sqrt((f*(1-f))/T);
 

box_vol=1;

% Volume of Box
for i=1:n
    box_vol=box_vol*(abs(B(i)-C(i)));
end

%Volume of intersection
vol=f*box_vol;

%Calculating Confidence interval

CI(1)=vol-(1+W)*sd*box_vol;
CI(2)=vol+(1+W)*sd*box_vol;

end

end




  

