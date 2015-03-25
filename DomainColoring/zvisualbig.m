%rand_name=num2str(rand);
%rand_name=rand_name(3:end);
rand_name=['yell' num2str(randint(1,1,[10 2100]))];  
fid=fopen([rand_name '.bmp'],'w');
   y  =  linspace(-1*pi,1*pi,2000);
   x  =  linspace(-1*pi,1*pi,2000);
len_x =  length(x);
len_y =  length(y);
 xnew =  0; 
 ynew =  0;
    a =  0;    
    b =  0;
   xn =  0;   
   yn =  0;
rough =  0;
  %  rgb2 =  zeros(500,500,3);
 zval =  zeros(len_y,3);  
    



  i=66;fwrite(fid,  i,'uint8');  %magic word
  i=77;fwrite(fid,  i,'uint8');
  
  i=len_x*len_y*3+54;fwrite(fid,  i,'uint32');
  
  i= 0;fwrite(fid,  i,'uint32');  %unused
  
  i=54;fwrite(fid,  i,'uint32');  %offset where the data is present

  i=40;fwrite(fid,  i,'uint32');  %no.bytes in header
  
  i=  len_y;fwrite(fid,  i,'uint32'); % width in pixel

  i=  len_x;fwrite(fid,  i,'uint32');%height in pixel

  i= 1;fwrite(fid,  i,'uint8');  %no of color plane
  i= 0;fwrite(fid,  i,'uint8');

  i=24;fwrite(fid,  i,'uint8');  %no of bits per pixel
  i= 0;fwrite(fid,  i,'uint8');

  i= 0;fwrite(fid,  i,'uint8');  %compression (0 for no compression)
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');

  i=len_x*len_y*3;fwrite(fid,  i,'uint32'); %size of raw bmp data
  

  i= 0;fwrite(fid,  i,'uint32'); % h resolution
  
  i= 0;fwrite(fid,  i,'uint32'); % v resolution

  i= 0;fwrite(fid,  i,'uint32');% no. of color in pallete

  i= 0;fwrite(fid,  i,'uint32'); % all colors are important

 
 m12=log(2);


tic

for m=1:len_x

    %for n=len_y:-1:1
     z = y(:)+j*x(m);
     z = j./sqrt(z)./log(z);
     
     hue = mod(-angle(z)/(2*pi),1);
     
     abs_z= abs(z);

     val = mod(log(abs_z)/m12,1);
     val = 1 -(1-val).^2; 
     val = 0.8 +val *0.2;
     
     z_real=real(z);
     z_imag=imag(z);
     for kk=1:len_y
     if z_real(kk)>pi || z_imag(kk)>pi
        z_real(kk)=pi;    
        z_imag(kk)=pi;
     elseif z_real(kk)<-pi || z_imag(kk)<-pi
        z_real(kk)=-pi;   
        z_imag(kk)=-pi;
     else
        z_real(kk)=z_real(kk);
        z_imag(kk)=z_imag(kk);
     end
     end
     sat =abs( sin(pi*z_imag).*sin(pi*z_real).*...
               cos(pi*z_imag).*cos(pi*z_real)).^0.75;

     sat = 1 -(1-sat).^15; 
     
     zval(:,1)= hue;
     zval(:,2)= 1-sat;
     zval(:,3)= val;
    %end

    rgb=hsv2rgb(zval);
   % rgb2(m,:,1)=     rgb(:,1);
   % rgb2(m,:,2)=     rgb(:,2);
   % rgb2(m,:,3)=     rgb(:,3);
    rgb=squeeze(255*rgb);
    rgb=rgb';
    fwrite(fid,  rgb,'uint8');
   
end
toc
st=fclose(fid);


    
