%circle packing
function circlePacking
a=0;
b=1;
x = a + (b-a).*rand(25,1);
y = a + (b-a).*rand(25,1);
x(1:4)=[0 1 1 0];
y(1:4)=[0 0 1 1];
tri = delaunay(x,y);
h=triplot(tri,x,y);
%get(h);
[row,col]=size(tri);
inCntr=zeros(row,2);

[cx,cy]=pol2cart(linspace(0,2*pi,100),1);

for n=1:row
    triIndex=tri(n,:);
    [C,r]=inCenter(x(triIndex,1),y(triIndex,1));
    inCntr(n,:)=C;
    patch(r*cx+C(1),r*cy+C(2),'r');
end

line(inCntr(:,1),inCntr(:,2),'marker','o','linestyle','none');

axis equal

function [C,r]=inCenter(px,py)

c=sqrt((px(1)-px(2)).^2+(py(1)-py(2)).^2);
a=sqrt((px(2)-px(3)).^2+(py(2)-py(3)).^2);
b=sqrt((px(3)-px(1)).^2+(py(3)-py(1)).^2);

s=(a+b+c)/2;
r=sqrt( (s-a)*(s-b)*(s-c) / s ) ;
%A=sqrt( s*(s-b)*(s-c) *( s-a ) )

C=[0 0];
P=a+b+c;
C(1)=(a*px(1)+b*px(2)+c*px(3))/P;
C(2)=(a*py(1)+b*py(2)+c*py(3))/P;

return