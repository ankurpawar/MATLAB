NX= 1200;
NY= 1200;
N= 3000000;
SCALE= (NX / 8);
maxcount=0;
x=0.2;y=0.3;x1=0;y1=0;

r=sqrt(3);
img = zeros(NX,NY);
	for n=1:N
		a0 = 3 * (1 + r - x) / ((1 + r - x)^2+ y*y) - (1 + r) / (2+r);
		b0 = 3 * y / ((1 + r - x)^2 + y*y);
		f1x = a0 / (a0*a0 + b0*b0);
		f1y = -b0 / (a0*a0 + b0*b0);
		switch (floor(mod(3.5*rand,3)))
		case 0
			x1 = 3 * (1 + r - x) / ((1 + r - x)^2.0 + y*y) - (1 + r) / (2 + r);
			y1 = 3 * y / ((1 + r - x)^2 + y*y);
		case 1
         x1 = -f1x / 2 - f1y * r / 2;
         y1 = f1x * r / 2 - f1y / 2;
	    case 2
         x1 = -f1x / 2 + f1y * r / 2;
         y1 = -f1x * r / 2 - f1y / 2;
        end
		if (n < 100)
			continue;
        end
		ix = x * SCALE + NX/2;
		iy = y * SCALE + NY/2;
		x = x1;
		y = y1;
		if (ix < 0 || iy < 0 || ix >= NX || iy >= NY)
			continue;
        end
        ix=floor(ix);
        iy=floor(iy);
		if ix<2000 && iy<2000 && ix>0 && iy>0
        img(iy,ix)=img(iy,ix)+1;     
        maxcount=max(maxcount,img(iy,ix));
        end
        
    end
 maxcount=log(maxcount);
for n=1:NX*NY
    if img(n)>0
       img(n)=128*log(img(n))/maxcount;  
    end
end
image(img)
colormap(flipud(bone(128)))
%(iy*NX+ix)