%% Isosurface example
% t = 0.5*(1 + sqrt(5));
%pd_psi_210 = @(r,theta,phi) exp(-r).*(r.^2).*(cos(theta).^2)/(32*pi);
%barth = @(x,y,z) 4*(t.^2.* x.^2 - y.^2).*(t.^2.*y.^2 - z.^2).*(t.^2.*z.^2 - x.^2) - (1+2*t).*(x.^2 + y.^2 + z.^2 - 1).^2
%configuring the range
%[x y z] = meshgrid(-10:.1:10,-10:.1:10,-10:.1:10);

%create array of probability density magnitudes
%psi_210_vals = pd_psi_210(x,y,z);

%plotting
%imagesc(psi_210_vals(:,:,1)); %x-y plane
%isosurface(-10:.1:10, -10:.1:10, -2:.1:2, psi_210_vals, 0.001);
%fv = isosurface(-10:.1:10, -10:.1:10,-10:.1:10, psi_210_vals, 0.001);

s=0.025;

[x,y,z]=meshgrid(-2:s:2,-2:s:2,-2:s:2);

t = 0.5*(1 + sqrt(5));

u= 4*(t^2* x.^2 - y.^2).*(t^2.* y.^2 - z.^2).*(t^2 .* z.^2 - x.^2) - (1+2*t)*(x.^2 + y.^2 + z.^2 - 1).^2;

fv=isosurface(u,0);
patch(fv,'facecolor','r')
axis equal