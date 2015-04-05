%pentaflake2
%pentaflake
%darw curve
golden = 1.618033988749894848204586;
n=5;
h=0.5;
t=linspace(0,2*pi,n+1);
colmap=(lines);
%patch(h*sin(t),h*cos(t),colmap(1,:));
%hold on

xarr=h*sin(t-3*108/180*pi);
yarr=h*cos(t-3*108/180*pi);
phas=(-5:2:3)';
rough=length(phas);
%1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for n=1:length(phas)
 [xx,yy]=pol2cart(phas(n)*72/180*pi,golden^1*h);
 patch(yy+xarr,xx+yarr,colmap(2,:));
 end


%2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phas=(-7:2:3)';
for k=1:5
    [roughx,roughy]=pol2cart(-k*2*pi/5+72*pi/180,(golden^3)*h+h/golden);    
    %patch(roughy+xarr,roughx+yarr,colmap(2,:));
    for n=1:rough
        %rough2=1*phas*(36)/180*pi;    
        [xx,yy]=pol2cart(phas(n)*(72)/180*pi,golden^1*h);
        patch(roughy-yy-xarr,roughx-xx-yarr,colmap(4,:));
    end
end


%3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phas=(-7:2:3)';
 for kk=1:5
     [roughx2,roughy2]=pol2cart(kk*2*pi/5+36*pi/180,golden^5*h+h*golden);    
%     patch(roughy2+xarr,roughx2+yarr,colmap(5,:));
     for n=1:rough
         %rough2=1*phas*(36)/180*pi;    
         [xx,yy]=pol2cart(1*phas(n)*(72)/180*pi,golden^1*h);
         patch(roughy2-yy-xarr,roughx2-xx-yarr,colmap(6,:));
     end
        
     for k=1:5
         [roughx,roughy]=pol2cart(-k*2*pi/5+72*pi/180,golden^3*h+h/golden);    
         
         for n=1:rough
         
             [xx,yy]=pol2cart(1*phas(n)*(72)/180*pi,golden^1*h);
             patch(roughy2-roughy+yy+xarr,roughx2-roughx+xx+yarr,colmap(7,:));
         end
     end
 end
% 
% %4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for kkk=1:5
     [roughx3,roughy3]=pol2cart(kkk*2*pi/5+72*pi/180,golden^7*h+h*golden^3);
    
     for n=1:rough
         
         [xx,yy]=pol2cart(1*phas(n)*(72)/180*pi,golden^1*h);
         patch(roughy3-yy-xarr,roughx3-xx-yarr,colmap(9,:));
     end
%        
     for k=1:5
         [roughx,roughy]=pol2cart(-k*2*pi/5+72*pi/180,golden^3*h+h/golden);    
         
         for n=1:rough
             
             [xx,yy]=pol2cart(1*phas(n)*(72)/180*pi,golden^1*h);
             patch(roughy3-roughy+yy+xarr,...
                   roughx3-roughx+xx+yarr,colmap(11,:));
         end
     end
 
 
     for kk=1:5
         [roughx2,roughy2]=pol2cart(kk*2*pi/5+36*pi/180,golden^5*h+h*golden);    
        
         for n=1:rough
             
             [xx,yy]=pol2cart(1*phas(n)*(72)/180*pi,golden^1*h);
             patch(roughy3-roughy2+yy+xarr,...
                   roughx3-roughx2+xx+yarr,colmap(13,:));
         end
 
         for k=1:5
             [roughx,roughy]=pol2cart(-k*2*pi/5+72*pi/180,golden^3*h+h/golden);    
           
             for n=1:rough
                 
                 [xx,yy]=pol2cart(phas(n)*(72)/180*pi,golden^1*h);
                 patch(roughy3-roughy2+roughy-yy-xarr,...
                       roughx3-roughx2+roughx-xx-yarr,colmap(15,:));
             end
         end
     end
 end
 axis square off
