%recursion4
function recursion4
x=0;
y=0;
r=1;
circle(x,y,6,5);
axis square off
return

function circle(x,y,r,n)

    if n>0
        ran=rand(1,3);
        [X] = Bezier([x-r/7 x x+r/7;y-0.75*r y-0.94*r y-0.75*r],7,0);
        %plot([x-r/7 x x+r/7],[y-0.85*r y-0.94*r y-0.85*r],'o','color','b'),hold on
        rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1 1],'facecolor',1-ran),hold on
        plot(X(1,:), X(2,:),'color',ran,'linewidth',2);hold on 
        circle(x-r/2,y,r/2,n-1);
        circle(x+r/2,y,r/2,n-1);
    end
return
