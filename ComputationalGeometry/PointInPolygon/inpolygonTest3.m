function inpolygonTest3
%using angle sum method only at bounding points

polyPoint=rand(30,2);
K=convhull(polyPoint(:,1),polyPoint(:,2));
polyP=polyPoint(K,:);


p=rand(100000,2);
%p=[0.5 0.5;1 1;0.75 0.75;0 0];
lenx=length(polyP);
inPoly=logical(zeros(length(p),1));
[maxX, iMaX]=max(polyP(:,1));
[maxY, iMaY]=max(polyP(:,2));
[minX, iMiX]=min(polyP(:,1));
[minY, iMiY]=min(polyP(:,2));
indexBound=[iMiX iMiY iMaX iMaY];
TWOPI=round(2*pi*10000)/10000; 
tic

for n=1:length(p)
    
    point=p(n,:);
    ind=4;
    m=4;
    theta=0;
    if point(1)<minX || point(1)>maxX || point(2)<minY || point(2) >maxY
       %point out of bounding box 
    else
        while m<=4
            vecA=-polyP(indexBound(m),:)+point;
            phi1=pi+atan2(vecA(2),vecA(1));
            vecB=-polyP(indexBound(ind),:)+point;
            phi2=pi+atan2(vecB(2),vecB(1));
            %theta=theta+angle2D(vecA,vecB);
            theta=theta+abs(phi1-phi2);
            m=m+1;
            ind=m-1;
        end
    end
    theta=round(theta*10000)/10000;
    %theta
    if abs(theta)<pi
       inPoly(n)=true;
    end
    
end

toc
p2=p(inPoly,:);
patch(polyP(:,1),polyP(:,2),'y');
%line(p(:,1),p(:,2),'marker','o','linestyle','none')
%line(p2(:,1),p2(:,2),'marker','.','linestyle','none')
axis equal    

function theta=angle2D(vecA,vecB)
        phi1=atan2(vecA(2),vecA(1));
        phi2=atan2(vecB(2),vecB(1));
        theta=phi2-phi1;
        while theta > pi
           theta = theta - 2*pi;
        end
        while theta < -pi
           theta = theta + 2*pi;
        end
return