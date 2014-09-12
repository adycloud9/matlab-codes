%Function ExpTimeToFill  returns  the expected number of flips needed to
%fill the urn to accuracy EPS

function sum = ExpFillTime(T,EPS)
clc;
i=1;
p = 0;
sum = 0;
pf = 0; 
while ~(and(pf> 1-EPS,i*p < EPS))
    i = i + 1;
    P = ProbFullUrn(T,i);
    p1 = P(i);
    p2 = P(i-1);
    p = p1-p2;
    pf = pf + p;
    sum = sum + i*p;
end

end



