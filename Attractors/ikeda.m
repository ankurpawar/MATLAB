%ikeda
%ikeda attractor
%zn+1 = a + b zn exp[ i k - i p / (1 + | zn2 | ) ]
%a = 0.85, b = 0.9, k = 0.4, p = 7.7
a = 0.85;
b = 0.9;
k = 0.4;
p = 7.7;

z=0+0i;
total=100000;
z_arr=zeros(total,1);
for n=2:total
    z=z_arr(n-1);
    z_arr(n)=a + b*z* exp( i*k - i*p/(1 + abs( z^2 ) ) );
end
z_imag=imag(z_arr);
z_real=real(z_arr);
plot(z_imag,z_real,'.','markersize',1);
