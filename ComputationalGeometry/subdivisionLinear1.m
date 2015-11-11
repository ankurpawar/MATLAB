function [W, G] = subdivisionLinear1(V, F)
%function divides a triangular mesh represented by v, f
%linearly. Output vertices W have some duplicate
%points. Output faces G are unique.
%      v1                   v1             
%     / \                  / \ 
%    /   \      ->        a---c
%   /     \              / \ / \
% v2 ----- v3          v2-- b --v3 
nV = size(V,1); %number of vertices
nF = size(F,1); %number of faces

nW = nV + 3*nF; %number of new vertices
nG = 4*nF; %number of new faces
G = zeros(nG, 3); %new faces array
W = zeros(nW, 3); %new vertices array
ind = zeros(1,6);
W(1:nV, :) = V;
for n = 1:nF
   % find the mid point of an edge 
   a = (V(F(n,1),:) + V(F(n,2),:)) / 2;
   b = (V(F(n,2),:) + V(F(n,3),:)) / 2;
   c = (V(F(n,1),:) + V(F(n,3),:)) / 2;
   W(nV + (n-1)*3+1,:) = a;
   W(nV + (n-1)*3+2,:) = b;
   W(nV + (n-1)*3+3,:) = c;
   ind(1:3) = F(n,:);
   ind(4) = nV+(n-1)*3+1;
   ind(5) = nV+(n-1)*3+2;
   ind(6) = nV+(n-1)*3+3;
   
   G(4*(n-1)+1,1) = ind(1);
   G(4*(n-1)+1,2) = ind(4);
   G(4*(n-1)+1,3) = ind(6);
   
   G(4*(n-1)+2,1) = ind(2);
   G(4*(n-1)+2,2) = ind(5);
   G(4*(n-1)+2,3) = ind(4);
   
   G(4*(n-1)+3,1) = ind(3);
   G(4*(n-1)+3,2) = ind(6);
   G(4*(n-1)+3,3) = ind(5);
   
   G(4*(n-1)+4,1) = ind(4);
   G(4*(n-1)+4,2) = ind(5);
   G(4*(n-1)+4,3) = ind(6);
end