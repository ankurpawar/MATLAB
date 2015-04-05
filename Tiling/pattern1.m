%Pattern1
function pattern1

cmap1=pink(7);   
cmap2=1-bone(7);   
for m=1:12:36
    cc=1;
    for n=0:4:24
       [x,y]=leaf(1);
       patch(x+1+m,y+1+n,cmap1(cc,:),'edgecolor',cmap1(cc,:));
       [x,y]=leaf(2);
       patch(x-1+m,y+1+n,cmap1(cc,:),'edgecolor',cmap1(cc,:));
       line([m m+1],[n n+1],'color',cmap1(cc,:),'linewidth',1);
       line([m m-1],[n n+1],'color',cmap1(cc,:),'linewidth',1);
       cc=cc+1;
    end
    line([m m],[0 n],'color',cmap1(1,:));
    cc=1;
    for n=0:4:24
       [x,y]=leaf(3);
       patch(x+1+6+m,y-1+n+3,cmap2(cc,:),'edgecolor',cmap2(cc,:));
       [x,y]=leaf(4);
       patch(x-1+6+m,y-1+n+3,cmap2(cc,:),'edgecolor',cmap2(cc,:));
       line([m+6 m+1+6],[n+3 n-1+3],'color',cmap2(cc,:),'linewidth',1);
       line([m+6 m-1+6],[n+3 n-1+3],'color',cmap2(cc,:),'linewidth',1);
       cc=cc+1;
    end
    line([m+6 m+6],[0+3 n+3],'color',cmap2(1,:));
end

axis equal off


function [x,y]=leaf(c)

    switch c
        case 1
            t=-pi/2:1/(10*pi):pi;
            [x,y]=pol2cart(t,1);
            x=[0 x+1];
            y=[0 y+1];
        case 2
            t=0:1/(10*pi):1.5*pi;
            [x,y]=pol2cart(t,1);
            x=[0 x-1];
            y=[0 y+1];
        case 3
            t=pi:1/(10*pi):2.5*pi;
            [x,y]=pol2cart(t,1);
            x=[0 x+1];
            y=[0 y-1];
        case 4
            t=pi/2:1/(10*pi):2*pi;
            [x,y]=pol2cart(t,1);
            x=[0 x-1];
            y=[0 y-1];    
    end