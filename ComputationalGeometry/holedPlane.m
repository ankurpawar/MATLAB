function [f,v]=holedPlane
%holedCobe
%this function generates a 3d plane with circular holes
%within it. 
%function returns face and vertex data
%[f,v]=holedCube;
%patch('Faces', f, 'Vertices', v, 'FaceColor', 'r','edgecolor','none');


a=-1;
b=1;
x = a + (b-a).*rand(40,1);
y = a + (b-a).*rand(40,1);
x(1:4)=[-1 1 1 -1];
y(1:4)=[-1 -1 1 1];
tri = delaunay(x,y);
%h=triplot(tri,x,y);
%get(h);
[row,col]=size(tri);
inCntr=zeros(row,2);
inRadius=zeros(row,1);

[cx,cy]=pol2cart(linspace(2*pi,0,100),1);

for n=1:row
    triIndex=tri(n,:);
    [C,r]=inCenter(x(triIndex,1),y(triIndex,1));
    inCntr(n,:)=C;
    inRadius(n)=r;
    %patch(r*cx+C(1),r*cy+C(2),'r');
end

x1 = [-1 1 1 -1];
y1 = [-1 -1 1 1];

a=cell(row+1,1);
b=cell(row+1,1);

a{1,1}=x1;
b{1,1}=y1;

for n=2:row+1
    
    a{n,1}=0.9*inRadius(n-1)*cx+inCntr(n-1,1);
    b{n,1}=0.9*inRadius(n-1)*cy+inCntr(n-1,2);
end

[f, v] = poly2fv(a,b);
%whos f v

%patch('Faces', f, 'Vertices', v, 'FaceColor', 'r','edgecolor','none');
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