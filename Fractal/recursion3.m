%recursion3
function recursion3
%triangle(x,y,wide,high);
t=0:0.1:2*pi;
x=0;
y=0;
r=1;
circle(x,y,1,6);
axis square off

%alpha(0.5)
return

function circle(x,y,r,n)

    if n>0
        rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1 1],'facecolor',rand(1,3))
        rectangle('Position',[x-r/8,y-r,r/4,r/4],'Curvature',[1 1],'facecolor',rand(1,3))
        circle(x-r/2,y,r/2,n-1);
        circle(x+r/2,y,r/2,n-1);
    end
return
%JAVA code
% /*
%  * Author: Havard Rast Blok
%  * E-mail: 
%  * Web   : www.rememberjava.com
%  */
% 
% import java.awt.*;
% import javax.swing.*;
% 
% /*
%  * Draw recursive circles
%  */
% public class Cantor extends JFrame
% {
%   public Cantor()
%   {
%     setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
%     setSize(400, 400);
%     show();
%   }
%   
%   public void paint( Graphics g )
%   {
%     g.setColor( Color.white );
%     g.fillRect( 0, 0, getWidth(), getHeight() );
%     g.setColor( Color.black );
% 
%     drawCantor(200, 200, 150, Math.PI/2, 7, g);
%   }
%   
%   public void drawCantor(int x, int y, int r, double a, int times, Graphics g)
%   {
%     System.out.println("x="+x+", y="+y+", r="+r+", times="+times);
% 
%     if(times>0)
%     {
%       drawMidCircle(x, y, r, g);
%       drawCantor(x+r/2, y, r/2, 0, times-1, g);
%       drawCantor(x-r/2, y, r/2, 0, times-1, g);
%     }
%   }
% 
%   public void drawMidCircle(int x, int y, int r, Graphics g)
%   {
%     g.drawOval(x-r, y-r, 2*r, 2*r);
%   }
%   public static void main( String args[] )
%   {
%     new Cantor();
%   }
% 
% }