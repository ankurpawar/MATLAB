function brokenSphere
%function to generate sphere with some mesh triangles deleted
[x,y,z]=sphere(30);
[f,v,c] = surf2patch(x,y,z,z);

delete_index=rand(length(f),1)';
del2=delete_index<=0.5;
del=delete_index>0.5;

faces2=f(del2,:);

f=f(del,:);
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

scFile=fopen('heartSurf.sc','a');
[v,tface]=patch2tripatch(v,faces2);
patch2OBJ(v,tface,'lost1');
patch2OBJ(v,new_faces,'lost2');
fclose(scFile);

axis equal