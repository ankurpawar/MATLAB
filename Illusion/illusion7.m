%optical illusion7
t = 0:pi/20:2*pi;
x1 = sin(t);
y1 = cos(t);
x = x1;
y = y1;
[x, y] = polybool('intersection', x1, y1+0.75, x1+0.75, y1);
x = (x)-2;
y = (y)-2;
phi = pi/4+linspace(0,2*pi,9);
len_x = length(x);
num1 = floor(len_x/2);
num2 = len_x - floor(len_x/2);
[theta,r] = cart2pol(x,y);

colmap = [zeros(num1,3) ; ones(num2,3)];
for n = 1:5
    for m = 1:8
        for k = 1:length(phi)
            [x2,y2] = pol2cart(theta+phi(k),r);
            if mod(m,2)
                patch(x2+m*7,y2+n*7,[0.2 0.2 0.9],'edgecolor','flat','linewidth',1.5,'FaceVertexCData',colmap);
            else
                patch(x2+m*7,y2+n*7,[0.2 0.2 0.9],'edgecolor','flat','linewidth',1.5,'FaceVertexCData',1-colmap);
            end
        end
    end
end
set(gcf,'color',[0.72 0.6 0.7]);
axis off equal
%If you have export_fig then uncomment below line,else download it.
%export_fig png illusion7