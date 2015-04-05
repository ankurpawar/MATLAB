%wheelsonwheels,a=a(1),b=a(2),c=a(3)
prompt = {'Enter choice:'};
dlg_title = 'Number';
num_lines = 1;
def = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
t=-2*pi:0.01:2*pi;
arr=[1  7 -17
     4  0  -2
     0  2  -6
     1 -5   7
    -1 -6   2
    -4  3  -9
    -2  4  -5
     1  8  -5
    -2  5  19
     2 -8 -17
     1 -8 -17
     1 -16 -17
    -1 -10 -10
    -6  2   2
    -2  7   4
    -4 -18  17
    -2  8  -10
    14 -19   0
     4  -3 -10
    -2  7  -9
     2 -5  -7
    -2  3  6
    -2.5  4.5   -7
    -5.5  9    3.5
     3.5 -2.5  6.5];
a=arr(choice,:);
%a=floor(-20+(40)*rand(1,3))/2;

z=exp(i*a(1)*t)+exp(i*a(2)*t)/2+exp(i*a(3)*t)/3;
y=imag(z);x=real(z);
plot(y,x,'linewidth',2,'color',[0.5 0.5 0.8]);
axis([min(y) max(y) min(x)-0.1 max(x)+0.1])

axis equal off
str1(1) = {['$ z=e^{' num2str(a(1)) 'ti}+\frac{1}{2}e^{' num2str(a(2))...
            'ti}+\frac{1}{3}e^{' num2str(a(3)) 'ti} $']};
str1(2) = {['$ x=\Re(z),y=\Im(z) $']};
str1(3) = {['$ t=-2\pi:0.01:2\pi,i=\sqrt{-1} $']};
text('Interpreter','latex',...
     'String',str1,...
     'Position',[min(min(y)) max(max(x))],...
     'FontSize',20);
