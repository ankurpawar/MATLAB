%Polytiling2
x=[0 1 0 -1;0 -1 -1 0;0 0 1 1];
y=[0 -1/sqrt(3) -2/sqrt(3) -1/sqrt(3);...
   0 -1/sqrt(3)  1/sqrt(3)  1/cos(pi/6);...
   0  1/cos(pi/6)  1/sqrt(3) -1/sqrt(3)];
%patch(x',y','r')
%axis square tight
colmap1=[0.3 0.4 0.2;0.5 0.6 0.7;0.4 0.8 0.9];
colmap2=[0.3 0.5 0.6;0.6 0.7 0.4;0.4 0.2 0.5];
total=8;
gap=1/cos(pi/6)+1/sqrt(3);
rough=-1;
for ky=1:total
        rough=-rough;
    for kx=1:total
        %if mod(kx+ky,2)==0
        % patch(x'+kx*2+rough/2,y'+ky*gap,'r','facecolor','flat'...
        %     ,'facevertexcdata',colmap2,'linewidth',1.5);
       % else
         patch(x(1,:)'+kx*2+rough/2,y(1,:)'+ky*gap,'r','facecolor',colmap2(1,:));
         patch(x(2,:)'+kx*2+rough/2,y(2,:)'+ky*gap,'r','facecolor',colmap2(2,:));
         patch(x(3,:)'+kx*2+rough/2,y(3,:)'+ky*gap,'r','facecolor',colmap2(3,:));
        %end
        
    end
end
%zoom(1.6)
%set(gcf,'position',[0 0 800 800])
%set(gca,'position',[0.01 0.01 0.95 0.95 ])
axis off equal
%export_fig eps rombille