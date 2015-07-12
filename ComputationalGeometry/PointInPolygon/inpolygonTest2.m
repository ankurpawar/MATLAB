function inpolygonTest2
%using angle sum method

x=[3 3 0];
y=[3 0 0];

maxX=max(x);
p=-2+4*rand(10,2);
polyP=[x(:) y(:)];
lenx=length(x);
inPoly=logical(zeros(length(p),1));
[maxX, iMaX]=max(x);
[maxY, iMaY]=max(y);
[minX, iMiX]=min(x);
[minY, iMiY]=min(y);
indexBound=[iMaX iMaY iMiX iMiY];
TWOPI=round(2*pi*10000)/10000; 
tic

for n=1:length(p)
    
    point=p(n,:);
    ind=lenx;
    m=1;
    theta=0;
    if point(1)<minX || point(1)>maxX || point(2)<minY || point(2) >maxY
       %point out of bounding box 
    else
        while m<=lenx
            vecA=point-polyP(m,:);
            vecB=point-polyP(ind,:);
            theta=theta+acos(dot(vecA,vecB)/(sqrt(sum(vecA.^2))*sqrt(sum(vecB.^2))));  
            m=m+1;
            ind=m-1;
        end
    end
    theta=round(theta*10000)/10000;
    
    if theta>=TWOPI
       inPoly(n)=true;
    end
    
end

toc
p2=p(inPoly,:);
patch(x,y,'y');
line(p(:,1),p(:,2),'marker','o','linestyle','none')
line(p2(:,1),p2(:,2),'marker','x','linestyle','none')
    