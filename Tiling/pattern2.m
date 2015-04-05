%Pattern1
function pattern2
total=12;

%cmap=spring(total);
cmap=pink(total);
%cmap=1-autumn(total);
len=total;
 for m=total:-1:1
     for n=1:total       
          c=ceil(1+(4-1)*rand);
          switch c
              case 1   
                [x,y]=leaf(1);
                patch(x+2*n,y+2*m,cmap(randindex(len),:),'edgecolor','none');
              case 2
                [x,y]=leaf(2);
                patch(x-min(x)+2*n,y+2*m,cmap(randindex(len),:),'edgecolor','none');
              case 3
                [x,y]=leaf(3);
                patch(x+2*n,y-min(y)+2*m,cmap(randindex(len),:),'edgecolor','none');
              case 4
                [x,y]=leaf(4);
                patch(x-min(x)+2*n,y-min(y)+2*m,cmap(randindex(len),:),'edgecolor','none');
          end
     end
 end


axis equal off

function ind=randindex(len)
    ind = ceil(len*rand);
%randindex end here    

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