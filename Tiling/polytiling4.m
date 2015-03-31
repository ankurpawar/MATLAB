%polytiling4
n=6;
t=linspace(0-pi/4,2*pi-pi/4,n*2+1);
x=cos(t);
y=sin(t);

gapx1=2*cos(pi/12);
gapy2=2*cos(pi/12)-(cos(pi/12)-cos(pi/4));
gapx2=cos(pi/12);
total=8;
rough=-gapx2/2;
for ky=1:total
    rough=-rough;
    for kx=1:total  
        if mod(kx+ky,2)
            patch(x+kx*gapx1+rough,y+ky*gapy2,[0.6 0.75 0.65]);
        else
            patch(x+kx*gapx1+rough,y+ky*gapy2,[0.6 0.5 0.8]);
        end
    end
end

axis equal off