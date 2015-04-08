%bzanim
n=1:276;
img=zeros(400,400,3);
filename='line (';
M = moviein(276);
for k=1:276
   fname=[filename num2str(k) ').png'];
   img=imread(fname); 
   imshow(img);
   %axis off image
   M(:,k)=getframe;
   drawnow;
end
movie2avi(M,'bzanima.avi','quality',100,'compression','Indeo5')