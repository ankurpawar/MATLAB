%foricosa
[X,Y,Z,types] = Deca(9,10,10,2,0.75);
[row,col]=size(X);
[x,y,z]=sphere;
Z=Z+10;
%[Z,Y]=transform2d(Z,Y,0,0,pi,0,0);
scfile=fopen('MackayDeca.sc','w');
cmap=hot(row);
for n=1:row
    surf(x+X(n),y+Y(n),z+Z(n),'facecolor',cmap(n,:),'edgecolor','none');
    %shader2ScFile('mirror',['ball' num2str(n)],cmap(n,:),scfile);
    %primitive2ScFile('sphere',['ball' num2str(n)],[X(n) Y(n) Z(n)],1,scfile);
    hold on;
end
fclose(scfile);
hidden off
axis equal