%heart surf
[x,y,z]=heart(40,40);
scFile=fopen('heartSurf.sc','a');


[f,v,c] = surf2patch(x,y,z,z);
[m,n]=size(f);
new_faces=zeros(m*2,3);
new_faces(1,:)=[f(1,1) f(1,2) f(1,3)];
for count=2:2:2*m-1
    count2=count/2;
    new_faces(count,:)=[f(count2,3) f(count2,4) f(count2,1)];
    new_faces(count+1,:)=f(count2+1,1:3);
end
new_faces(2*m,:)=[f(count2+1,3) f(count2+1,4) f(count2+1,1)];
patch('vertices',v,'faces',new_faces,'FaceVertexCdata',c,'FaceColor','flat');

mesh2ScFile(v,new_faces-1,'heartShader','heartMesh',scFile);
fclose(scFile);

axis equal