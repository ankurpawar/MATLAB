%modified code for base motif fractal
prompt = {'Enter choice:','Iterations'};
dlg_title = 'Number form 1-10';
num_lines = 1;
def = {'1','2'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
iters=str2num(answer{2});
switch(choice)
    case 1  %cesaro fractal
        angle=[0 pi/2 pi/2 pi/2];     %base
        motif=[85 -170 85]*pi/180;  %motif
    case 2  %cesaro fractal2
        angle  =[0 pi/2 pi/2 pi/2];   %base
        motif=[-85 170 -85]*pi/180; %motif
    case 3  %cesaro fractal3
        angle  =[0 pi/2 pi/2 pi/2];   %base
        motif=[60 -120 60]*pi/180;  %motif
    case 4  %inverse koch
        angle = [0, -2/3*pi, -2/3*pi];%base
        motif=  [-pi/3 2*pi/3 -pi/3]; %motif
    case 5  %koch   snowflake
        angle = [0, -2/3*pi, -2/3*pi];%base
        motif=  [pi/3 -2*pi/3 pi/3]; %motif
    case 6  %hex cesaro
        angle  =[30 60 60 60 60 60]*pi/180;   %base
        motif  =[85 -170 85]*pi/180;         %motif
    case 7
        angle=  [0 pi/2 pi/2 pi/2];   %base
        motif  =[-90 90 90 0 -90 -90 90]*pi/180;         %motif
        iters=2;
    case 8    %Koch curve
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[-90 90 90 -90]*pi/180;         %motif
    case 9    %box fractal
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[90 -90 -90 90]*pi/180;         %motif
    case 10    %unkonown
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[-45 -135 225 -45]*pi/180;         %motif
    case 11    %
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[45 135 -225 45]*pi/180;         %motif
    case 12    %
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[45 135 -225 45]*pi/180;         %motif
        
end


l = 1;
motif_len=length(motif);
motif_len_2=motif_len+1;
for i=1:iters
    l = l/3;
    angle1 = zeros([4*length(angle),1]);
    for j=1:length(angle)
        % insert the Koch generator here
        angle1(motif_len_2*j-motif_len:motif_len_2*j) = [angle(j) motif];
        %angle1(4*j-3:4*j) = [angle(j) motif];
    end
    angle = angle1;
end

x = zeros([length(angle)+1, 1]);
y = zeros([length(angle)+1, 1]);

x(1) = 0; y(1) = 0;
phi=0;
for i=1:length(angle);
    phi = phi+angle(i);
    x(i+1) = x(i) + l * cos(phi);
    y(i+1) = y(i) + l * sin(phi);
end


% plot(x ,y);
% axis off square;

line(x,y);

axis equal on
%
