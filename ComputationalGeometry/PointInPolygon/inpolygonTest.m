function inpolygonTest

x=[3 3 0];
y=[3 0 0];
maxX=max(x);
p=-2+4*rand(100000,2);

polyPoint=-2+4*rand(30,2);
K=convhull(polyPoint(:,1),polyPoint(:,2));
polyP=polyPoint(K,:);

lenx=length(x);
inPoly=logical(zeros(length(p),1));
maxX=max(x);
maxY=max(y);
minX=min(x);
minY=min(y);
tic

for n=1:length(p)
    
    point=p(n,:);
    c=false;
    ind=lenx;
    m=1;
    if point(1)<minX || point(1)>maxX || point(2)<minY || point(2) >maxY
       %point out of bounding box 
    else
        while m<=lenx

            if  (y(m) <= point(2) && point(2) < y(ind))...
              ||(y(ind) <= point(2) && point(2) < y(m))...
              &&(point(1) < (x(ind)-x(m))*(point(2)-y(m))/(y(ind)-y(m))+x(m) )
              c=~c; 
            end

            m=m+1;
            ind=m-1;
        end
    end
    inPoly(n)=c;
    
end

toc
p=p(inPoly,:);
%patch(x,y,'y');
%line(p(:,1),p(:,2),'marker','o','linestyle','none')
    