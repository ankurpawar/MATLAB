%3d box fractal
r = zeros(3,3,3);
r(:,:,1) = [0 1 0;0 0 0;0 1 0];
r(:,:,2) = [1 0 1;0 1 0;1 0 1];
r(:,:,3) = [0 1 0;0 0 0;0 1 0];
for n = 1:1
    rough = zeros(3^n,3^n,3^n);
    rough2 = zeros(3^(n+1),3^(n+1),3^(n+1));
    
    rough2(:,:,1:3^n) = [rough r rough;rough rough rough;rough r rough];
    rough2(:,:,3^n+1:2*(3^n)) = [r   rough r  ;rough   r   rough;r   rough   r];
    rough2(:,:,2*(3^n)+1:3*(3^n)) = [rough r rough;rough rough rough;rough r rough];
    r = rough2;
end

[m,n,o] = ind2sub(size(rough2),find(rough2==1));
h1 = line(m,n,o,'marker','x','markersize',3,'linestyle','none');
view(3)
