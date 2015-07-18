%dodecahedron 2 sc
phi=(1+sqrt(5))/2;
dVert=[1 1 1
    1 1 -1
    1 -1 1
    1 -1 -1
    -1 1 1
    -1 1 -1
    -1 -1 1
    -1 -1 -1
    0 1/phi phi
    0 1/phi -phi
    0 -1/phi phi
    0 -1/phi -phi
    1/phi phi 0
    1/phi -phi 0
    -1/phi phi 0
    -1/phi -phi 0
    phi 0 1/phi
    phi 0 -1/phi
    -phi 0 1/phi
    -phi 0 -1/phi];

dFace=[1 13 2 18 17;
    1 9 5 15 13;
    13 15 6 10 2;
    2 10 12 4 18;
    18 17 3 14 4;
    1 9 11 3 17;
    5 9 11 7 19;
    15 5 19 20 6;
    6 20 8 12 10;
    20 19 7 16 8;
    8 12 4 14 16;
    11 7 16 14 3];


load greatDodeca
gdVert=stellatedVert;
gdFace=stellatedFace;

load greatStellatedDodeca
gsdVert=stellatedVert;
gsdFace=stellatedFace;

load smallStellatedDodeca
ssdVert=stellatedVert;
ssdFace=stellatedFace;

patch('faces',dFace,'vertices',dVert,'facecolor',[0.5 0.5 0.5]);
dVert(:,2)=dVert(:,2)+18;
patch('faces',dFace(1,:),'vertices',dVert,'facecolor',[0.5 0.5 0.5]);

gdVert(:,1)=gdVert(:,1)+7;
patch('faces',gdFace,'vertices',gdVert,'facecolor',[0.5 0.5 1]);
gdVert(:,2)=gdVert(:,2)+18;
patch('faces',gdFace(1:5,:),'vertices',gdVert,'facecolor',[0.5 0.5 1]);

ssdVert(:,1)=ssdVert(:,1)+14;
patch('faces',ssdFace,'vertices',ssdVert,'facecolor',[0.5 1 0.5]);
ssdVert(:,2)=ssdVert(:,2)+18;
patch('faces',ssdFace(1:5,:),'vertices',ssdVert,'facecolor',[0.5 1 0.5]);

gsdVert(:,1)=gsdVert(:,1)+28;
patch('faces',gsdFace,'vertices',gsdVert,'facecolor',[0.5 1 0]);
gsdVert(:,2)=gsdVert(:,2)+18;
patch('faces',gsdFace(1:5,:),'vertices',gsdVert,'facecolor',[0.5 1 0]);

text(-5,0,0,'1','fontsize',12,'FontName','Courier');
text(0,0,5,'2','fontsize',12,'FontName','Courier');
text(0,0,10,'3','fontsize',12,'FontName','Courier');
text(10,0,10,'4','fontsize',12,'FontName','Courier');

%text(-5,-5,0,'1.Dodecahedron','fontsize',15,'FontName','Courier');
%text(0,0,-5,'2.Great Dodecahedron','fontsize',15,'FontName','Courier');
%text(0,10,10,'3.Small Stellated Dodecahderon','fontsize',15,'FontName','Courier');
%text(0,-5,10,'4.Great Stellated Dodecahderon','fontsize',15,'FontName','Courier');

axis equal off
view(3)