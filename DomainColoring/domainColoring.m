function hsvImg = domainColoring(Z,type)
% Function convert complex array Z to Hue, Sat and Val.
% Usage
% [hue, sat, val] = domainColoring(Z)
% [hue, sat, val] = domainColoring(Z,type)
% Input :
% Z is a complex 2d array, type can be between 1 to 31.
% When function is called with first parameter only then type is taken as
% 31 by default.
% Output :
% hsvImg is a 3d array such that hsvImg(:,:,1) = hue, hsvImg(:,:,2) = sat, 
% hsvImg(:,:,3) = val. Use hsv2rgb function to convert hsvImg to rgb image.

if (nargin > 2) || (nargin == 0) 
    error('incorrect number of argument');
elseif nargin == 1
    type = 31;
elseif nargin == 2
    if type > 30 || type < 1
        type = 31;
    end
end

hsvImg = zeros(size(Z,1), size(Z,2), 3);
hue = (pi+angle(Z))/(2*pi);
coloringType = type;
y = imag(Z);
x = real(Z);
switch coloringType
    case 1
        r = log(abs(Z))/(2*log(2));
        sat = mod(abs(cos(pi*x).*sin(pi*y)).^2.5,1);
        sat = 1 -(1-sat).^3;
        val = abs(cos(2*pi*r));
        val = 1 -(1-val).^2;
        val = 0.6 +val *0.4;
    case 2
        r = log(abs(Z))/(2*log(2));
        for n = 1:numel(x)
            if (x(n) > 2*pi) || (y(n) > 2*pi)
                x(n) = 0;
                y(n) = 0;
            end
            if (x(n) < -2*pi) || (y(n) < -2*pi)
                x(n) = 0;
                y(n) = 0;
            end
        end
        sat = mod(abs(cos(pi*y).*sin(pi*x)).^2.5,1);
        sat = 1 -(1-sat).^3;
        
        val=abs(cos(2*pi*r));
        val = 1 -(1-val).^2;
        val = 0.6 + val *0.4;
    case 3
        r = log(abs(Z))/log(2);
        sat = mod(r, 1);
        sat = 0.4 + sat *0.6;
        
        sat = mod(abs(cos(pi*sat).^2.*cos(10*pi*hue).^2), 1);
        sat = 1 -(1-sat).^6;
        sat = 0.1 + sat *0.9;
        
        val = mod(r, 1);
        val = 1 -(1-val).^3;
        val = 0.6  +val *0.4;
        
        sat = mod((val.*sat).^3, 1);
    case 4
        %loop to limit absolute value of function from 0 to 2pi
        %and limit imaginary and real value of function from -pi to pi
        abs_z = abs(Z);
        for m = 1:numel(abs_z)
            if abs_z(m) > 2*pi
                abs_z(m) = 2*pi;
            end
            if (x(m)> pi) || (y(m) > pi)
                x(m) = pi;
                y(m) = pi;
            end
            if (x(m) < -pi) || (y(m) < -pi)
                x(m) = -pi;
                y(m) = -pi;
            end
        end
        sat = mod(abs(sin(2*abs_z)).^15,1);
        %power is 15 to make white line wider
        sat = 1 -(1-sat).^9;
        
        val = mod(abs(sin(pi*y).*sin(pi*x).*...
                      cos(pi*y).*cos(pi*x)).^0.5,1);
        val = 1 -(1-val).^7;
        val = 0.3 + val *0.7;
    case 5
        abs_z = abs(Z);
        for m = 1:numel(abs_z)
            if abs_z(m) < 0.1
                abs_z(m) = 0.1;
            elseif abs_z(m) > 3*pi
                abs_z(m) = 3*pi;
            end
            
            if (x(m)> pi) || (y(m) > pi)
                x(m) = pi;
                y(m) = pi;
            end
            if (x(m) < -pi) || (y(m) < -pi)
                x(m) = -pi;
                y(m) = -pi;
            end
        end
        r=(abs_z);
        r=r/max(max(r));
        
        sat = abs(cos(pi*y).*sin(pi*y).*...
                   cos(pi*x).*sin(pi*x));
        sat = (1 - sat).^15;
        
        val = 1 - abs(r);
        val = 1 - (1 - val).^5;
        val = 0.1 + val *0.9;  
    case 6
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod(abs(cos(2*pi*x).*sin(2*pi*y)).^0.5,1);
    case 7
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod((log(abs_z)/log(2)),1);
        sat = sqrt(abs((cos(pi*val).*sin(2*pi*sat))));
    case 8
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod((log(abs_z)/log(2)),1);
        sat = 1 -(1-sat).^3; 
        sat = 0.6 +sat *0.4;
        sat = sqrt(abs(cos(2*pi*hue.*val).*sin(2*pi*hue.*sat)));
    case 9
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod((log(abs_z)/log(2)),1);
        sat = 1 -(1-sat).^3; 
        sat = 0.6 +sat *0.4;
        sat=mod(abs(cos(pi*y.*sat).*sin(pi*x.*val)).^1.25,1);
    case 10
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod((log(abs_z)/log(2)),1);
        sat = 1 -(1-sat).^3; 
        sat = 0.6 +sat *0.4;
        sat = sqrt(abs(cos(pi*x.*val-pi/2).*sin(pi*y.*sat))); 
    case 11
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        val = 0.6 + val *0.4;
        sat = sqrt(abs(cos(pi*x).*sin(pi*y)));
        sat = 1 -(1-sat).^3; 
    case 12
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        sat = 0.4 + val *0.6;
        val = 0.6 + val *0.4;
        sat = mod(abs(cos(pi*x.*val).*sin(pi*y.*sat)).^1.25,1);
        sat = 1 -(1-sat).^3;
    case 13
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        sat = 0.4 + val *0.6;
        val = 0.6 + val *0.4;
        sat=sqrt(abs(cos(pi*x.*val).*sin(pi*y.*sat)));
        sat = 1 -(1-sat).^3;
    case 14
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        sat = 0.4 + val *0.6;
        val = 0.6 + val *0.4;
        sat = sqrt(abs(cos(2*pi*hue.*val).*sin(2*pi*hue.*sat)));
        sat = 1 -(1-sat).^3;
    case 15
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        sat = 0.4 + val *0.6;
        val = 0.6 + val *0.4;
        sat = abs((cos(pi*sat).*sin(pi*pi*val)));
        sat = 1 -(1-sat).^3;    
    case 16
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1 -(1-val).^3;
        sat = 0.4 + val *0.6;
        val = 0.6 + val *0.4;
        sat = mod(abs(cos(pi*x).*sin(pi*y)).^2.5,1);
        sat = 1 -(1-sat).^3;
    case 17
        abs_z = abs(Z);
        r = log(abs_z)/(2*log(2));
        val = mod(abs(cos(2*pi*r)).^1,1);
        val = 1 -(1-val).^9;
        val = 0.35 +val *0.65;
        
        sat = mod(log(abs_z)/log(2),1);
        sat = 1 -(1-sat).^3;
        sat = 0.6 +sat *0.4;
        sat = mod(abs(cos(10*pi*hue)).^0.75,1);
    case 18
        %vizz5
        abs_z = abs(Z);
        r = log(abs_z)/(log(2));
        sat = mod(log(abs_z)/log(2),1);
        sat = 0.4 + sat *0.6;
        sat = mod(abs(cos(pi*sat).^0.75),1);
        sat = 1 -(1-sat).^2;
        sat = 0.1 +sat *0.9;
        
        val = mod(log(abs_z)/log(2),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        val = mod(abs(cos(10*pi*hue)).^0.12,1);
        sat = mod((val.*sat).^3,1);
    case 19
        abs_z= abs(Z);
        sat = mod(log(abs_z),1);
        sat = 0.4 +sat *0.6;
        sat = mod(abs(cos(pi*sat).^0.75.*cos(10*pi*hue).^5),1);
        sat = 1 -(1-sat).^5;
        sat = 0.1 +sat *0.9;
        
        val = mod(log(abs_z),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod((val.*sat).^3,1);
    case 20
        %vizz11
        abs_z= abs(Z);
        hue = mod(-angle(Z)/(2*pi),1);
        val = mod(log(abs_z)/log(2),1);
        val = 1 -(1-val).^2;
        val = 0.8 +val *0.2;
        for m = numel(Z)
            if x(m)>pi || y(m)>pi
                x(m) = pi;
                y(m) = pi;
            end
            if x(m)<-pi || y(m)<-pi
                x(m) = -pi;
                y(m) = -pi;
            end
        end
        sat = mod(abs(sin(pi*x).*sin(pi*y).*...
                       cos(pi*x).*cos(pi*y)).^0.75,1);
        sat = (1-sat).^15;
    case 21
        abs_z = abs(Z);
        sat = ones(size(abs_z));
        val = 1-1./(1.1 +5*log(abs_z+1));
    case 22
        abs_z= abs(Z);
        r=log(abs_z)/(log(2));
        sat = mod(log(abs_z),1);
        sat = 0.4 +sat *0.6;
        sat = mod(abs(cos(pi*sat).^2),1);
        sat = 1 -(1-sat).^6;
        sat = 0.1 +sat *0.9;
        
        val = mod(log(abs_z),1);
        val = 1 -(1-val).^3;
        val = 0.6 +val *0.4;
        
        sat =mod(abs(cos(10*pi*hue)).^5.*(val.*sat).^3,1);
        sat = 1 -(1-sat).^6;
        sat = 0.1 +sat *0.9;
    case 23
        arg2 = mod(-angle(Z)/(2*pi),1);
        
        val = mod( log(abs(Z))/log(2),1);
        val = 1 -(1-val).^5;
        val = 0.7 +val *0.3;
        
        for m=1:numel(Z)
            if x(m)>pi || y(m)>pi
                x(m) = pi;
                y(m) = pi;
            end
            if x(m)<-pi || y(m)<-pi
                x(m) = -pi;     
                y(m) = -pi;
            end
        end
        sat = mod(abs(sin(pi*x).*sin(pi*y).*...
                      cos(pi*x).*cos(pi*y)).^0.5,1);
        sat = (1-sat).^5;
        val = val.*arg2.^0.3;
    case 24
        hue = mod(-angle(Z)/(2*pi)*0.17,0.17);
        arg2 = mod(-angle(Z)/(2*pi),1);
        abs_z= abs(Z);
        
        val = mod(log(abs_z)/log(2),1);
        val = 1 -(1-val).^2;
        val = 0.8 +val *0.2;
        
        for m = 1:numel(Z)
            if x(m)>pi || y(m)>pi
                x(m) = pi;
                y(m) = pi;
            end
            if x(m)<-pi || y(m)<-pi
                x(m) = -pi;     
                y(m) = -pi;
            end
        end
        sat = ones(size(Z));
        sat = mod(abs(sin(pi*x).*sin(pi*y).*...
                      cos(pi*x).*cos(pi*y)).^0.5,1);
        sat = 1 -(1-sat).^5;
        val = val.*arg2.^0.3;
    case 25
        abs_z = abs(Z);
        val = mod(log(abs_z)/log(2),1);
        val = 1 -(1-val).^3;
        sat = 0.6 + val *0.4;
        val = 0.4 + val *0.6;
    case 26
        r = abs(Z);
        a = 0.40824829046386301636 * y;
        b = 0.70710678118654752440 * x;
        d =  1./(1+(r).^2);
        r = mod(abs(sqrt(d)),1);
        red =   0.5 + 0.81649658092772603273.*y.*d;
        green = 0.5 - d .* ( a - b );
        blue =  0.5 - d .* ( a + b );
        d = 0.5  - r.*d;
        d(r < 1) = -d(r < 1);
        
        red = red + d;
        green = green + d;
        blue = blue + d;
        
        ColorMset = zeros(size(x,1),size(x,2),3);
        ColorMset(:,:,1) = 255*red;
        ColorMset(:,:,2) = 255*green;
        ColorMset(:,:,3) = 255*blue;
        
        hs_v=rgb2hsv(ColorMset);
        for m = 1 : numel(Z)
            if x(m)>pi || y(m)>pi
                x(m) = pi;
                y(m) = pi;
            end
            if x(m)<-pi || y(m)<-pi
                x(m) = -pi;
                y(m) = -pi;
            end
        end
        hue = hs_v(:,:,1);
        sat = mod(abs(cos(pi*y).*cos(pi*x).*...
                      sin(pi*y).*sin(pi*x)).^0.5,1);
        sat = 1 -(1-sat).^5;
        sat = 1-(0.1 + sat *0.9);
        val = hs_v(:,:,3);
        val = val./max(val(:));
    case 27
        r = abs(Z);
        a = 0.40824829046386301636 * y;
        b = 0.70710678118654752440 * x;
        d =  1./(1+(r).^2);
        r = mod(abs(sqrt(d)), 1);
        red =   0.5   + 0.81649658092772603273 * y.*d;
        green = 0.5 -  d .* ( a - b );
        blue =  0.5  - d .* ( a + b );
        d = 0.5  - r.*d;
        d(r < 1) = -d(r < 1);
        
        red = red + d;
        green = green + d;
        blue = blue + d;
        
        red = mod(red,1);
        blue = mod(blue,1);
        green = mod(green,1);
        
        ColorMset = zeros(size(x,1), size(x,2), 3);
        ColorMset(:,:,1) = 255*red;
        ColorMset(:,:,2) = 255*green;
        ColorMset(:,:,3) = 255*blue;
        
        hsv_2 = rgb2hsv(ColorMset);
        for m = 1:numel(Z)
            if x(m)>pi || y(m)>pi
                x(m) = pi;
                y(m) = pi;
            end
            if x(m)<-pi || y(m)<-pi
                x(m) = -pi;
                y(m) = -pi;
            end
        end
        hue = hsv_2(:,:,1);
        sat = mod(abs(cos(pi*x).*cos(pi*y).*...
                      sin(pi*x).*sin(pi*y)).^0.5,1);
        sat = 1 -(1-sat).^5;
        sat = 1-(0.1 + sat * 0.9);
        val = hsv_2(:,:,3);
        val = val./max(val(:));
    case 28
        abs_z = abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1-(1-val).^3;
        val = 0.6 +val *0.4;
        sat = sqrt(abs(sin(pi*x).*cos(pi*y-pi/2)));
        sat = 1 -(1-sat).^3;
    case 29
        abs_z= abs(Z);
        sat = mod((log(abs_z)/log(2)),1);
        val = mod((log(abs_z)/log(2)),1);
        val = 1-(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod(abs(cos(2*pi*x.*val).*sin(2*pi*y.*sat)).^3,1);
        sat = 1 -(1-sat).^3;
    case 30
        abs_z= abs(Z);
        val = mod((log(abs_z)/log(2)),1);
        val = 1-(1-val).^3;
        val = 0.6 +val *0.4;
        sat = mod(abs(cos(2*pi*x).*sin(2*pi*y-pi/2)).^3,1);
        sat = 1 -(1-sat).^3;
    case 31
        abs_z = abs(Z);
        val = mod(log(abs_z)/log(2),1);
        sat = mod(log(abs_z)/log(2),1);
        val = 1 -(1 - val).^3;
        sat = 0.6 +sat *0.4;
        val = 0.4 +val *0.6;
        sat = 1 -(1-sat).^3;
end
hsvImg(:,:,1) = hue;
hsvImg(:,:,2) = sat;
hsvImg(:,:,3) = val;
end