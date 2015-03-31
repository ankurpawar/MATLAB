%logistics map

r=2.4:0.00005:4;
lenx=length(r);
x=zeros(1,lenx);
x(1)=0.59;
for n=2:lenx
    x(n)=r(n)*x(n-1)*(1-x(n-1));
end
%plot(r,x,'.','markersize',1);
scatter(r,x,1,r);